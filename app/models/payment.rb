class Payment < ActiveRecord::Base
  belongs_to :project
  belongs_to :client
end
