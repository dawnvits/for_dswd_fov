class AdminController < ApplicationController

  layout "admin"
  before_action :verify_if_admin

  def index
  	@tracking_forms = TrackingForm.all.paginate(:page => params[:page], :per_page => 24)
  end

  private
	def verify_if_admin
	  authenticate_employee!
	  if !current_employee.admin
	     redirect_to root_url
	  end
	end

end
