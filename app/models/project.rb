class Project < ActiveRecord::Base
  belongs_to :category
  belongs_to :department
  belongs_to :marketplace
  belongs_to :status
end
