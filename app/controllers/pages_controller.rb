class PagesController < ApplicationController
  skip_before_action :authenticate_user!
  def home
    @products = Product.page params[:page]
  end
end
