class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
    include SessionsHelper
    
  before_action :configure_permitted_parameters, if: :devise_controller?

    protected

    #def configure_permitted_parameters
    #    devise_parameter_sanitizer.for(:signup) { |u| u.permit(:name, :email, :password,:rollNo,:password_confirmation,:avatar) }
    #end 
end
