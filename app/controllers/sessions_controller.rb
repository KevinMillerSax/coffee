class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      log_in user
      remember user
      redirect_to root_url
    else
      flash.now[:danger] = "Your username and email don't match!"
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
