class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    phone = params[:user][:phone_number].to_i
    if phone > 9999999999 || phone < 1000000000
      flash[:danger] = "Username taken or Phone Number invalid, try again"
      redirect_to new_user_path
    else
      @user = User.find_or_create_by(user_params)
      Phonelib.valid?(user_params[:phone_number])
      session[:user_id] = @user.id
      redirect_to profile_path
      flash[:success] = "You have been registered and logged in!"
    end
  end

  def show
    @user = User.last
  end

  private

  def user_params
    params.require(:user).permit(:user_name, :phone_number)
  end
end
