# frozen_string_literal: true

class ArtistasController < ApplicationController
  before_action :find_artista

  def nombre
    @artista
    render layout: nil
  end

  def bio
    @artista
    render layout: nil
  end

  private

  def find_artista
    @artista = Artista.find(params[:id])
  end

end
