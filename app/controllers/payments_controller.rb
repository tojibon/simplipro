class PaymentsController < ApplicationController
  
  def index
    
  end
  
  def show
    
  end
  
  def project_payments
    @Project = Project.find(params[:id])
    render :layout => false     
  end
  
  def client_payments
    
    @Total_Price = @Total_Paid = @Total_Due = 0
    
    Project.where("client_id = ?", params[:id]).each do |project|
      @Total_Price+=project.price
    end

    Payment.where("client_id = ?", params[:id]).each do |payment|
      @Total_Paid+=payment.amount
    end

    @Total_Due = @Total_Price - @Total_Paid
    render :layout => false     
  
  end
  
end
