class Location < ActiveRecord::Base
  belongs_to :store
  belongs_to :user
end
