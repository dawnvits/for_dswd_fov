class DepartmentsController < ApplicationController
  
  layout "admin"
  before_action :verify_if_admin

  def index
    @departments = Department.all.order(:name).paginate(:page => params[:page], :per_page => 12)
  end

  def new
    @department = Department.new
  end

  def create
    @department = Department.new( params.require(:department).permit(:name) )
    if @department.save
      flash[:notice] = "Department created successfully!"
      redirect_to departments_url
    else
      render('new')
    end
  end

  def edit
    @department = Department.find(params[:id])
  end

  def update
    @department = Department.find(params[:id])
    if @department.update_attributes( params.require(:department).permit(:name) )
      flash[:notice] = "Department updated successfully!"
      redirect_to departments_path
    else
      render('edit')
    end
  end

  def delete
    @department = Department.find(params[:id])
  end

  def destroy
    @department = Department.find(params[:id]).destroy
    flash[:notice] = "Department deleted successfully!"
    redirect_to departments_url
  end

  private

	def verify_if_admin
	  authenticate_employee!
	  if !current_employee.admin
	     redirect_to root_url
	  end
	end

end
