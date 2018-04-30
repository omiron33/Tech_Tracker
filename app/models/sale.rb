class Sale < ActiveRecord::Base
  belongs_to :user
  belongs_to :customer
  belongs_to :store
  has_many :computers
end
