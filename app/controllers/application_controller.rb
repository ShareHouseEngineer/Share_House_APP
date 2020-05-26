class ApplicationController < ActionController::Base
protect_from_forgery with: :exception
before_action :configure_permiited_parameters, if: :devise_controller?

protected
    def after_sign_up_path_for(resource)
        photos_path
    end
    def after_sign_in_path_for(resource)
    	photos_path
	end
	def after_sign_out_path_for(resource)
		root_path

	end
	def configure_permiited_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:email])
	end
end
