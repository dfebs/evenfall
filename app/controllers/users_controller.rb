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
      flash.now[:alert] = @user.errors.full_messages.join(", ")
      render :new, status: :unprocessable_entity
    end
  end

  private
  def user_params
    params.expect user: [ :username, :email_address, :password, :password_confirmation, :profile_picture ]
  end
end
