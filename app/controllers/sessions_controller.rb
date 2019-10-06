# frozen_string_literal: true

class SessionsController < ApplicationController

  def new
    render layout: 'login'
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      redirect_to encuentros_path
    else
      flash[:alert] = 'Las credenciales ingresadas no coinciden; inténtelo nuevamente'
      redirect_to login_path
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to login_path
  end
end
