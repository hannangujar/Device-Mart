class ApplicationController < ActionController::Base
    before_action :authenticate_user!, unless: :devise_controller?
    before_action -> { sleep 1 }

    private

  def current_product
    @current_product ||= current_user.products if user_signed_in?
  end
  helper_method :current_product
end
