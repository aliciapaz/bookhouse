class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery
  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def index
    render "home/index"
  end

  private
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :role, { user_info: %i[phone address balance] }])
    end

    def user_not_authorized
      flash[:alert] = "You're not authorized for this action"
      redirect_to root_path
    end
end
