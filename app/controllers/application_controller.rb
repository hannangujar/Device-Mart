class ApplicationController < ActionController::Base
    before_action :authenticate_user!, unless: :devise_controller?
    before_action -> { sleep 1 }
end
