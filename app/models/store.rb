class Store < ActiveRecord::Base
  has_many :locations
  has_many :users, through: :locations
  has_many :computers
  has_many :sales
  has_many :customers, through: :sales
  belongs_to :school
end
