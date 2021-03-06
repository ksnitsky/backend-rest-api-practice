class Api::V1::PostsController < Api::V1::BaseController
  before_action :set_post, only: %i[update patch show destroy]
  before_action :authenticate_request!, only: %i[create update destroy]

  def index
    @posts = Post.all
  end

  def create
    @post = current_user!.posts.create(post_params)

    if @post.save
      render :show, status: :created
    else
      render json: @post.errors,
             status: :unprocessable_entity
    end
  end

  def update
    @post.update(post_params)
    head :no_content
  end

  def patch
    @post.change_rating(rating.to_i)
    head :no_content
  end

  def show
    #  shows @post (defined in set_post method)
  end

  def destroy
    @post.destroy
    head :no_content
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.permit(
      :title,
      :content,
      :category_title,
      :author_id,
      :tag_list
    )
  end

  def rating
    params.require(:rating)
  end
end
