class Team < ActiveRecord::Base
  belongs_to :leader, foreign_key: "leader_id", class_name: "User"
  belongs_to :employee, foreign_key: "employee_id", class_name: "User"
end
