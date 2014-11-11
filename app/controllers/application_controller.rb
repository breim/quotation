class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # Creativity is a habit. 
  protect_from_forgery with: :exception

  helper_method :current_user

  before_filter :configure_devise_params, if: :devise_controller?
  def configure_devise_params
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit(:name,:cpf,:email,:password,:password_confirmation)
    end
    devise_parameter_sanitizer.for(:account_update) do |u|
      u.permit(:name,:cpf,:email,:password,:password_confirmation, :image,:image_file_name, :image_content_type, :image_file_size)
    end
  end

  
  def after_sign_in_path_for(resource)
  	case resource
        when User
        	then system_index_path
     	else 
        	root_path
    	end
	end


end
