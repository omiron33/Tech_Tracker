class Computer < ActiveRecord::Base
  belongs_to :school
  belongs_to :sale
end
