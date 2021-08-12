class UsersController < ApplicationController
  after_action :apply_content_range_header

  def index
    @users = User.all
    render json: @users
  end

  def show
    @user = User.find_by(id: params[:id])
    render json: @user
  end

  protected
  def apply_content_range_header
    response.headers['Content-Range'] = User.all.length
  end
end
