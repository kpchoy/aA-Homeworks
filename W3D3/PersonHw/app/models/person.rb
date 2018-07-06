class Person < ActiveRecord::Base
  #table name :  people
  #id             :integer 
  #name           #string
  #house_id       #integer
  #created_at     #datetime
  #updated_at     #datetime
  #

  validates :name, :house, presence :true

  belongs_to :person, {
      primary_key: :id,
      foreign_key: :house_id,
      class_name: 'House'
  }

end
