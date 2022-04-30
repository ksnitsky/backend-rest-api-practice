class Api::V1::UsersController < Api::V1::BaseController
  def index
    @users = User.all
  end

  def create
    @user = User.create(user_params)
    if @user.save
      render :show, status: :created
    else
      render json: { message: @post.error.full_messages },
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

  def user_params
    params.require(:user)
          .permit(
            :email,
            :username,
            :password
          )
  end
end
