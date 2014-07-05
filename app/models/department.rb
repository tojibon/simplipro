class Department < ActiveRecord::Base
  has_many :project
end
