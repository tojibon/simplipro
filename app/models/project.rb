class Project < ActiveRecord::Base
  belongs_to :category
  belongs_to :department
  belongs_to :marketplace
  belongs_to :status
  belongs_to :client,   class_name:Client,    foreign_key:"client_id"
  belongs_to :sales,    class_name:Sales,     foreign_key:"sales_id"
  belongs_to :designer, class_name:Designer,  foreign_key:"designer_id"
  belongs_to :markup,   class_name:Markup,    foreign_key:"markup_id"
  belongs_to :developer,class_name:Developer, foreign_key:"developer_id"
  has_many :payment
  
  
  
end
