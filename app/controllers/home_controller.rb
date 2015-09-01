class HomeController < ApplicationController
	
  before_action :authenticate_employee!
  
  def index
  	@tracking_forms = TrackingForm.all.where("origination_dept = :department OR current_dept = :department", {department: current_employee.department}).order(created_at: :desc).paginate(:page => params[:page], :per_page => 20)
  end

end
