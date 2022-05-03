class Api::V1::AuthenticationController < Api::V1::BaseController
  def create
    if user
      raise AuthenticateError unless user.authenticate(params.require(:password))

      render :show, status: :created
    else
      render json: { error: 'No such user' }, status: :unauthorized
    end
  end

  private

  def user
    @user ||= User.find_by(username: params.require(:username))
  end
end
