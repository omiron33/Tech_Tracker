class Store < ActiveRecord::Base
  has_many :locations
  has_many :users, through: :locations
  belongs_to :school
end
