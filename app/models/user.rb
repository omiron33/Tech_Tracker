class User < ActiveRecord::Base
  has_secure_password

  has_many :employees, through: :team_members, source: :employee
  has_many :team_members, foreign_key: :leader_id, class_name: "Team"

  has_many :leaders, through: :team_leads, source: :leader
  has_many :team_leads, foreign_key: :employee_id, class_name: "Team"

  has_many :sales
  has_many :locations
  has_many :schools, through: :locations
  has_many :customers, through: :sales
  has_many :sold_computers, through: :sales, source: :computers
  
end
