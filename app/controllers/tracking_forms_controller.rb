class TrackingFormsController < ApplicationController

  before_action :authenticate_employee!
  
  def show
    @tracking_form = TrackingForm.find(params[:id])
    @history = @tracking_form.form_histories.order(:created_at)
    @remark = @tracking_form.form_remarks.order(created_at: :desc)
  end

  def new
  	@tracking_form = TrackingForm.new
  end

  def create
    @tracking_form = TrackingForm.new(tracking_form_params)
    @tracking_form.current_dept = current_employee.department
    @tracking_form.origination_dept = current_employee.department
    @tracking_form.uid = SecureRandom.base64(10).tr('+/=', '0aZ').strip.delete("\n")
    if @tracking_form.save
      @tracking_form.form_histories.create(description: "#{current_employee.first_name} #{current_employee.middle_name} #{current_employee.last_name} created this form on #{Time.now.strftime('%B %d, %Y at %I: %M %p')}.")
      flash[:notice] = "Form created successfully!"
      redirect_to tracking_form_url(@tracking_form.id)
    else
      render('new')
    end
  end

  def edit
    @tracking_form = TrackingForm.find(params[:id])
  end

  def update
  	@tracking_form = TrackingForm.find(params[:id])
    @tracking_form.assign_attributes(tracking_form_params)

    if @tracking_form.changed?
        if @tracking_form.save
            @tracking_form.form_histories.create(description: "#{current_employee.first_name} #{current_employee.middle_name} #{current_employee.last_name} updated this form on #{Time.now.strftime('%B %d, %Y at %I: %M %p')}.")
            flash[:notice] = "Form updated successfully!"
            redirect_to tracking_form_url(@tracking_form.id)
        else
           render('edit')
        end
    else
        flash[:notice] = "No changes has been made"
        redirect_to tracking_form_url(@tracking_form.id)
    end
  end

  def delete
     @tracking_form = TrackingForm.find(params[:id])
  end

  def destroy
  	@tracking_form = TrackingForm.find(params[:id]).destroy
    flash[:notice] = "Form deleted successfully!"
    if current_employee.admin
      redirect_to admin_index_path
    else
      redirect_to root_url
    end
  end

  def for_forwarding
    @tracking_form = TrackingForm.find(params[:id])
  end

  def forwarding
     @tracking_form = TrackingForm.find(params[:id])
     @tracking_form.assign_attributes(params.require(:tracking_form).permit(:current_dept))

     if @tracking_form.changed?
        @tracking_form.update(:recently_created => 'false',
                              :forwarded => 'true',
                              :received => 'false',
                              :returned => 'false')
         if @tracking_form.save
            @tracking_form.form_histories.create(description: "#{current_employee.first_name} #{current_employee.middle_name} #{current_employee.last_name} forwarded this form to #{@tracking_form.current_dept} on #{Time.now.strftime('%B %d, %Y at %I: %M %p')}.")
            flash[:notice] = "Form is forwarded successfully!"
            redirect_to root_url
         else
            render('for_forwarding')
         end
     else
        flash[:notice] = "Form cannot be forwarded to same department"
        redirect_to tracking_form_url(@tracking_form.id)
     end
  
  end

  def for_return
    @tracking_form = TrackingForm.find(params[:id])
  end

  def returning
     @tracking_form = TrackingForm.find(params[:id])
     @tracking_form.assign_attributes(params.require(:tracking_form).permit(:current_dept, :return_notice))

     if @tracking_form.changed?
         if @tracking_form.current_dept != current_employee.department
            @tracking_form.update(:recently_created => 'false',
                                  :forwarded => 'false',
                                  :received => 'false',
                                  :returned => 'true')
             if @tracking_form.save
                @tracking_form.form_histories.create(description: "#{current_employee.first_name} #{current_employee.middle_name} #{current_employee.last_name} returned this form to #{@tracking_form.current_dept} on #{Time.now.strftime('%B %d, %Y at %I: %M %p')}.")
                flash[:notice] = "Form is returned successfully!"
                redirect_to root_url
             else
                render('for_return')
             end # logical condition IF tracking_form.save
         else
            flash[:notice] = "Form cannot be returned to same department!"
            redirect_to tracking_form_url(@tracking_form.id)
         end # logical condition IF tracking_form.current_dept != current_employee.department
      else 
        flash[:notice] = "Please make the necessary changes"
        render('for_return')
      end # logical condition IF tracking_form.changed?
  end # end returning

  def add_remark
    @tracking_form = TrackingForm.find(params[:id])
    @remark = @tracking_form.form_remarks.new
  end

  def adding_remark
    @tracking_form = TrackingForm.find(params[:id])
    @remark = @tracking_form.form_remarks.new(params.require(:form_remark).permit(:tracking_form_id, :content))
    if @remark.save
       @tracking_form.form_histories.create(description: "#{current_employee.first_name} #{current_employee.middle_name} #{current_employee.last_name} added a remark on this form on #{Time.now.strftime('%B %d, %Y at %I: %M %p')}.")
       flash[:notice] = "Remark added successfully!"
       redirect_to tracking_form_url(@tracking_form.id)
    else
       render('add_remark')
    end
  end

  def receive
    @tracking_form = TrackingForm.find(params[:id])
    @tracking_form.update_attributes(:received => 'true', 
                                     :recently_created => 'false',
                                     :forwarded => 'false',
                                     :returned => 'false',
                                     :receiver => "#{current_employee.first_name} #{current_employee.middle_name} #{current_employee.last_name}")
    @tracking_form.form_histories.create(description: "#{current_employee.first_name} #{current_employee.middle_name} #{current_employee.last_name} of #{@tracking_form.current_dept} received this form on #{Time.now.strftime('%B %d, %Y at %I: %M %p')}.")
    flash[:notice] = "Form is now received"
    redirect_to tracking_form_url(@tracking_form.id)
  end

  def pending
     @tracking_forms = TrackingForm.all.pending.paginate(:page => params[:page], :per_page => 30)
  end

  def pendings_for_dept
     @tracking_forms = TrackingForm.all.pending.where("current_dept = ?", params[:department][:name]).paginate(:page => params[:page], :per_page => 50)
     @dept = params[:department][:name]
  end


  protected

  def tracking_form_params
    params.require(:tracking_form).permit(:date_filed, 
                                          :transaction_name,
                                          :transaction_type,
                                          :department,
                                          :complete_docs,
                                          :amount,
                                          :prepared_by,
                                          :pending,
                                          :pending_information)
  end
  
end