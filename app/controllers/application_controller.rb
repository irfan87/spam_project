class ApplicationController < ActionController::Base
attr_accessor :current_password, :email, :lastname, :first_name
# before_filter  :configure_permitted_parameters, if: :devise_controller?
# # before_filter :update_resource, if: :devise_controller?
#  protected

	# def configure_permitted_parameters
#
	#   devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :first_name, :last_name, :email, :password,
	#     :password_confirmation) }
#
	#   devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:username, :email, :password,
	#     :password_confirmation, :first_name, :last_name) }
	# end
#
 #   def update_resource(resource, params)
 #    if current_user.provider == "facebook"
 #     params.delete("current_password")
 #     resource.update_without_password(params)
 #    else
 #     resource.update_with_password(params)
 #    end
  #end
end