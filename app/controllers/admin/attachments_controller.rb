# frozen_string_literal: true

class Admin::AttachmentsController < AdminController

  def destroy
    if ActiveStorage::Attachment.find(params[:id]).purge
      flash.notice = 'El elemento se ha eliminado exitosamente'
    else
      flash.alert = 'Ocurrió un error intentando eliminar el elemento'
    end
    redirect_to request.referer
  end

end
