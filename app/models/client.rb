class Client < ActiveRecord::Base
  self.table_name = "admin_users"
  has_many :project  
  has_many :payment
  default_scope { where( :is_client => true ) }
  
  def display_name
    "#{full_name} <#{email}>"
  end
end
