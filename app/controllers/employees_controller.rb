class EmployeesController < ApplicationController

  layout "admin"
  before_action :verify_if_admin
  
  def index
    @employees = Employee.sort_by_last_name.paginate(:page => params[:page], :per_page => 10)
  end

  def show
    @employee = Employee.find(params[:id])
  end

  def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.new(new_employee_params)
    if @employee.save
      flash[:notice] = "Account created successfully!"
      redirect_to employees_url
    else
      render('new')
    end
  end

  def edit
    @employee = Employee.find(params[:id])
  end

  def update
    @employee = Employee.find(params[:id])
    if @employee.update_attributes(edit_employee_params)
      flash[:notice] = "Account updated successfully!"
      redirect_to employees_path
    else
      render('edit')
    end
  end

  def delete
    @employee = Employee.find(params[:id])
  end

  def destroy
    employee = Employee.find(params[:id]).destroy
    flash[:notice] = "Account deleted successfully!"
    redirect_to employees_url
  end

  def active 
     @employees = Employee.active.sort_by_last_name.paginate(:page => params[:page], :per_page => 10)
  end

  def inactive
    @employees = Employee.inactive.sort_by_last_name.paginate(:page => params[:page], :per_page => 10)
  end

  def administrators
    @employees = Employee.administrators.sort_by_last_name.paginate(:page => params[:page], :per_page => 10)
  end

  private

    def verify_if_admin
      authenticate_employee!
      if !current_employee.admin
         redirect_to root_url
      end
    end

    def new_employee_params
      params.require(:employee).permit(:first_name, :middle_name, :last_name, :email, :password, :department)
    end

    def edit_employee_params
      params.require(:employee).permit(:active, :admin)
    end


end
