class Sale < ActiveRecord::Base
  belongs_to :user
  belongs_to :customer
  has_many :computers
end
