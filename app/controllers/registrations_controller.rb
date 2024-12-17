class RegistrationsController < ApplicationController
  before_action :redirect_if_authenticated, only: [:create, :new]

  def create

  end

  def new
    @user = User.new
  end
end
