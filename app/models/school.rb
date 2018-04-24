class School < ActiveRecord::Base
    has_many :plans
    has_many :computers
    belongs_to :color
    has_many :locations
    has_many :users, through: :locations
    has_many :customers
end
