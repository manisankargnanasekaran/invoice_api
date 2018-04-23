module Api
  module V1
class UserLoginDetailsController < ApplicationController
  before_action :set_user_login_detail, only: [:show, :update, :destroy]

  # GET /user_login_details
  def index
    @user_login_details = UserLoginDetail.all

    render json: @user_login_details
  end

  # GET /user_login_details/1
  def show
    render json: @user_login_detail
  end

  # POST /user_login_details
  def create
    @user_login_detail = UserLoginDetail.new(user_login_detail_params)

   # @user_login_detail.organization_id = current_user.organization_user.organization_id

    if @user_login_detail.save
      render json: @user_login_detail, status: :created, location: @user_login_detail
    else
      render json: @user_login_detail.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /user_login_details/1
  def update
    if @user_login_detail.update(user_login_detail_params)
      render json: @user_login_detail
    else
      render json: @user_login_detail.errors, status: :unprocessable_entity
    end
  end

  # DELETE /user_login_details/1
  def destroy
    @user_login_detail.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_login_detail
      @user_login_detail = UserLoginDetail.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_login_detail_params
      params.require(:user_login_detail).permit(:email, :password, :deleted_at, :organization_user_id, :tenant_id)
    end
end
end
end