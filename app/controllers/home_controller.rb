# frozen_string_literal: true

class HomeController < ApplicationController
  before_action :find_encuentro_actual

  def index; end

  def artistas; end

  def actividades; end

  def conciertos; end

  def galeria; end

  private

  def find_encuentro_actual
    @encuentro = Encuentro.last
  end

end
