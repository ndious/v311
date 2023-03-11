# typed: strict

class ApplicationController < ActionController::API
  include ActionController::MimeResponds

  before_action :authenticate

  protected

  def authenticate
    login = request.headers['X-User']
    if login
      @user = Customer.find_by! login:
    else
      render json: { error: 'Missing parameters' }, status: :unprocessable_entity
    end
  end
end
