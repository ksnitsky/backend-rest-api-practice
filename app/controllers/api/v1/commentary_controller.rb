class Api::V1::CommentaryController < Api::V1::BaseController
  before_action :set_comment, only: %i[update destroy]
  before_action :authenticate_request!, only: %i[create update destroy]

  def create
    @comment = current_user!.commentaries.create(comment_params)

    if @comment.save
      render json: @comment, status: :created
    else
      render json: @comment.errors,
             status: :unprocessable_entity
    end
  end

  def update
    @comment.change_rating(rating.to_i)
    head :no_content
  end

  def destroy
    @comment.destroy
    head :no_content
  end

  private

  def set_comment
    @comment = Commentary.find(params[:id])
  end

  def rating
    params.require(:rating)
  end

  def comment_params
    params.permit(:text, :post_id)
  end
end
