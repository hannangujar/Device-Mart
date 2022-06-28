class Products::ReviewsController < ApplicationController
    include Commentable 
    before_action :set_commentable



    private
        def set_commentable
            @commentable = Prouct.find(params[:product_id])
        end
end