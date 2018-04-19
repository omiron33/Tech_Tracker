class School < ActiveRecord::Base
    has_many :plans
    has_many :computers
    belongs_to :color
    has_many :users, through: :location
    has_many :customers
end
