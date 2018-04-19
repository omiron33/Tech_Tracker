class Customer < ActiveRecord::Base
  belongs_to :school
  has_many :sales
  has_many :salesperson, through: :sales, source: :user
end
