class SessionsController < ApplicationController
  skip_before_filter :authenticate
  def new
  end

  def create
    user = User.find_by(username: params[:session][:username].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in user
      redirect_to user, notice: "Succesfully signed in"
    else
      flash.alert = 'Failed!'
      render action: 'new'
    end
  end

  def destroy
    sign_out
    redirect_to login_path
  end
end
