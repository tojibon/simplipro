class Designer < ActiveRecord::Base
  self.table_name = "admin_users"
  has_many :project  
  
  default_scope { where( :is_designer => true ) }
  
  def display_name
    "#{full_name} <#{email}>"
  end
end
