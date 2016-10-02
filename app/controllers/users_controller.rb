class UsersController < ApplicationController
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Account Created"
      redirect_to new_session_path
    else
      flash[:error] = @user.errors.full_messages.to_sentence
      redirect_to new_session_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:birthdate, :email, :password, :password_confirmation)
  end
end
