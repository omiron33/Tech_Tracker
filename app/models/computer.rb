class Computer < ActiveRecord::Base
  belongs_to :store
  belongs_to :sale
  belongs_to :skulist
end
