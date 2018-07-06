class House < ActiveRecord::Base

# validates :address, presence:true 

  has_many :residents, {
    primary_key: :id, #primary key of this table
    foreign_key: :house_id, #foreign key livesin person table
    class_name: :Person
  } #name of class we want this method to return
end
