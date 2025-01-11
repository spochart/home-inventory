class RegistrationsController < ApplicationController
  before_action :redirect_if_authenticated, only: [:create, :new]

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path, notice: "User registered successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def new
    @user = User.new
  end

  private

    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
end
