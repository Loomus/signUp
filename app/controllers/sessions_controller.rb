class SessionsController < ApplicationController
  def destroy
    session.delete(:user_id)
    flash[:success] = "You have been logged out"
    redirect_to root_path
  end
end
