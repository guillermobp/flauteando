# frozen_string_literal: true

class Home2Controller < ApplicationController
  before_action :find_encuentro_actual

  def index; end

  def artistas; end

  def artista
    @artista = Artista.find(params[:id])
    respond_to do |format|
      format.json { render json: @artista || false }
    end
  end

  def actividades; end

  def conciertos; end

  def galeria; end

  def vision
    render layout: nil
  end

  def mision
    render layout: nil
  end

  private

  def find_encuentro_actual
    @encuentro = Encuentro.where(habilitado: true).last
  end

end
