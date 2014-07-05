class Category < ActiveRecord::Base
  has_many :project
end
