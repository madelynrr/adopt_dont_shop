class Pet < ApplicationRecord

  belongs_to :shelter

  validates_presence_of :image, :name, :age, :sex, :adoption_status

end
