class ProductsController < ApplicationController
    def index
        if params[:search]
            @products = Product.where("name ILIKE ?", "%"+params[:search]+"%").page params[:page]
        else
            @products = Product.page params[:page]
        end

        if params[:company_id]
            @company = Company.includes(:products)
                                .find(params[:company_id])
            @products = @company.products
          else
            @product = Product.all
          end
    end
    def create
        product_params = params.require(:product).permit(:name,:search, :title, :discription, :price, pictures: [])
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
        params.require(:product).permit(:name,:search, :company_id, :title, :discription, :price, pictures: [])
    end
end
