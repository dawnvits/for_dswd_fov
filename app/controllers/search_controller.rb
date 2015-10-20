class SearchController < ApplicationController

  def index
  end

  def result
   @tracking_forms = TrackingForm.search(params[:search]).paginate(:page => params[:page], :per_page => 24)
  end

  def view
   if employee_signed_in?
     @tracking_form = TrackingForm.find_by_uid(params[:uid])
     @history = @tracking_form.form_histories.order(:created_at)
     @remark = @tracking_form.form_remarks.order(created_at: :desc)
   else
     @tracking_form = TrackingForm.find_by_uid(params[:uid])
     @first_history = @tracking_form.form_histories.order(:created_at).first
     @last_history = @tracking_form.form_histories.order(:created_at).last
     @remark = @tracking_form.form_remarks.order(created_at: :desc) 
   end
  end

end