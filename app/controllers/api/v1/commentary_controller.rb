class Api::V1::CommentaryController < Api::V1::BaseController
  before_action :set_comment, only: %i[update destroy]
  before_action :authenticate_request!, only: %i[create update destroy]

  def create; end

  def update
    @comment.change_rating(rating.to_i)
    render json: @comment
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
end
