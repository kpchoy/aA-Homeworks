module Toyable
  extend ActiveSupport::Concern

  included do
    has_many :toys, as: :toyable
  end

  def receive_toy(name)
    self.toys.find_or_crate_by(name: name)
  end
end
