class SessionsController < ApplicationController
  before_action :redirect_if_authenticated, only: [:create, :new]

  def create
    @user = User.authenticate_by(user_params)
    if @user
      active_session = login(@user)
      remember(active_session) if params[:user][:remember_me] == "1"
      redirect_to root_path, notice: "Signed in."
    else
      flash.now[:alert] = "Incorrect email or password."
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    forget_active_session
    logout
    redirect_to root_path, notice: "Signed out."
  end

  def new
  end

  private

    def user_params
      params.require(:user).permit(:email, :password)
    end
end
