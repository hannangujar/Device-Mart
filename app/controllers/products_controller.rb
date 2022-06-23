class ProductsController < ApplicationController
    def index
        @products = Product.page params[:page]
    end

    def create
        product_params = params.require(:product).permit(:name, :title, :discription, :price, pictures: [])
        @product = Product.create(product_params)

        if @product.valid?
        redirect_to product_path(@product)
        else
            flash[:errors] = @product.errors.full_messages
            redirect_to new_product_path(@product)
        end
    end
    def show
        @product = Product.find(params[:id])    
    end


    private
    def product_params
        params.require(:product).permit(:name, :title, :discription, :price, pictures: [])
    end
end
