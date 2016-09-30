class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(email: user_params[:email])
    if @user.nil?
      flash[:error] = "There is no account associated with that email address"
      redirect_to new_session_path
    elsif @user.authenticate(user_params[:password])
      flash[:success] = "Login Successful"
      redirect_to new_session_path
    else
      flash[:alert] = "Incorrect Password"
      redirect_to new_session_path
    end
  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
