class AccountInformationController < ApplicationController

  before_filter :redirect_if_logged_in

  def index
  end

  private

	def redirect_if_logged_in
	  if current_employee
	     redirect_to root_url
	  end
	end

end
