class UsersController < ApplicationController
    before_action :require_login
    def index
        @users = User.all
    end
    def show
        @user = User.find(params[:id])    
    end
    private

  def require_login
    unless logged_in?
      flash[:error] = "You must be logged in to access this section"
      redirect_to signin_url # halts request cycle
    end
  end
end