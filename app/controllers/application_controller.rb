class ApplicationController < ActionController::Base
before_action :configure_permiited_parameters, if: :devise_controller?
protect_from_forgery with: :exception
protected
    def after_sign_up_path_for(resource)
        photoes_index_path
    end
    def after_sign_in_path_for(resource)
    	photoes_index_path
	end
	def after_sign_out_path_for(resource)
		photoes_index_path
	end
	def configure_permiited_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:nema, :email])
	end
end
