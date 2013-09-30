class SessionsController < ApplicationController
  skip_before_filter :authenticate
  def new
  end

  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      sign_in user
      redirect_to user, notice: "Succesfully signed in"
    else
      redirect_to :back, alert: 'Username and password do not match!'
    end
  end

  def destroy
    sign_out
    redirect_to signin_path
  end
end
