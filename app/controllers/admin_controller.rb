# frozen_string_literal: true

class AdminController < ApplicationController
  before_action :init_globals

  def index; end

  private

  def init_globals
    if (!logged_in?)
      redirect_to login_path
    else
      @encuentros = Encuentro.all
      @tab = "#{params[:controller]}_#{params[:action]}"
    end
  end
end
