class User < ApplicationRecord
  validate :username, presence: true, uniqueness: true
  validate :password_digest, presence: { message: 'Password can\'t be blank' }
  validate :session_token, presence: true, uniqueness: true
  validate :password, length: {minimum: 6, allow_nil: true}
  before_validation :ensure_session_token

  def self.find_by_credentials(username, password)
    user = User.find_by(username: username)
    return user if user && BCrypt::Password.new(user.password_digest).is_password?(password)
    nil
  end

  def self.generate_session_token
    SecureRandom::urlsafe_base64(16)
  end

  def reset_session_token!
    self.session_token = User.generate_session_token
    self.save!
    self.session_token
  end

  def ensure_session_token
    self.session_token ||= User.generate_session_token
  end

  def password=(password)
    @passord = password
    self.password_digest = BCrypt::Password.create(password)
  end

end
