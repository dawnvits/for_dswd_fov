class AdminController < ApplicationController

  layout "admin"
  before_action :verify_if_admin

  def index
  end

  private
	def verify_if_admin
	  authenticate_employee!
	  if !current_employee.admin
	     redirect_to root_url
	  end
	end

end
