class School < ActiveRecord::Base
    has_many :plans
    belongs_to :color
    has_many :stores
    has_many :users, through: :stores
    
end
