class UsersController < ApplicationController
  allow_unauthenticated_access only: %i[new create]
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to new_session_path, notice: "User successfully created! Now login"
    else
      render new_user_path, alert: "There was an issue creating the user!"
    end
  end

  private
  def user_params
    params.expect user: [ :username, :email_address, :password, :password_confirmation, :profile_picture ]
  end
end
