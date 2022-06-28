module Commentable
    extend ActiveSupport::Concern
    include ActionView::RecordIdentifier
    include RecordHelper

    included do
        before_action :authenticate_user!
    end

    def create
        @review = @commentable.review.new(review_params)

        respond_to do |format|
             if @review.save
                redirect_to @commentable
            else
                format.turbo_stream { 
                    render turbo_stream: turbo_stream.replace(dom_id_for_records(@commentable, @review), partial: "reviews/form", locals: { review: @review, commentable: @commentable })
                }
                format.html { redirect_to @commentable }
            end
        end
    end

    private
    def review_params
        params.require(:review).permit(:body , :parent_id)
    end
end