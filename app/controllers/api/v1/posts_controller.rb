class Api::V1::PostsController < Api::V1::BaseController
  before_action :set_post, only: [:show]

  def index
    @posts = Post.all
  end

  def create
    @post = Post.create(post_params)
    if @post.save
      render :show, status: :created
    else
      render json: { message: @user.error.full_messages },
             status: :unprocessable_entity
    end
  end

  def update
  end

  def show
  end

  def destroy
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post)
          .permit(
            :title,
            :content,
            :category_title,
            :author_id,
            :tag_list
          )
  end
end
