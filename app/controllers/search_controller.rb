class SearchController < ApplicationController

  def index
  end

  def result
   @tracking_form = TrackingForm.search(params[:search]).first
	   if !@tracking_form.blank?
		   @history = @tracking_form.form_histories.order(:created_at)
		   @remark = @tracking_form.form_remarks.order(created_at: :desc)
	   end
  end

end
