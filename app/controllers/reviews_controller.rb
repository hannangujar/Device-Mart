class ReviewsController < ApplicationController
  # before_action :set_product
  before_action :set_review, only: [:edit, :update, :destroy]

  
  def new
    @review = @product.reviews.build
  end

  def create
    @review = @product.reviews.build(review_params)

    if @review.save
      respond_to do |format|
        format.html { redirect_to product_path(@product), notice: "Review was successfully created." }
        format.turbo_stream { flash.now[:notice] = "Review was successfully created." }
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @review.update(review_params)
      respond_to do |format|
        format.html { redirect_to product_path(@product), notice: "Review was successfully updated." }
        format.turbo_stream { flash.now[:notice] = "Review was successfully updated." }
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @review.destroy
  
    respond_to do |format|
      format.html { redirect_to product_path(@product), notice: "Review was successfully destroyed." }
      format.turbo_stream { flash.now[:notice] = "Review was successfully destroyed." }
    end
  end

  private

  def set_review
    @review = @product.reviews.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:content)
  end

  # def set_product
    # @product = current_product.reviews.find(params[:product_id])
  # end
end