class RegistrationsController < Devise::RegistrationsController

  protected

    def after_inactive_sign_up_path_for(employee)
      '/account_information/index'
    end

    def sign_up_params
      params.require(:employee).permit(:first_name, :middle_name, :last_name, :email, :password, :department)
    end

    def account_update_params
      params.require(:employee).permit(:email, :password, :current_password)
    end


end