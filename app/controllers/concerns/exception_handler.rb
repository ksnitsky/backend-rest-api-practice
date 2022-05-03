module ExceptionHandler
  extend ActiveSupport::Concern

  class AuthenticateError < StandardError; end

  included do
    rescue_from ActiveRecord::RecordNotFound do |e|
      render json: { error: e.message }, status: :not_found
    end

    rescue_from ActiveRecord::RecordInvalid do |e|
      render json: { error: e.message }, status: :unprocessable_entity
    end

    rescue_from ActiveRecord::RecordNotDestroyed do |e|
      render json: { errors: e.record.errors }, status: :unprocessable_entity
    end

    rescue_from AuthenticateError do
      render json: { error: 'Incorrect password' }, status: :unauthorized
    end
  end
end
