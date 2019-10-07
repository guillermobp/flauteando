# frozen_string_literal: true

class Admin::UsersController < AdminController
  before_action :find_user

  def edit; end

  def update
    if (user_params[:password] != user_params[:password_confirmation])
      flash[:alert] = 'Las contraseñas no coinciden'
    elsif @user.update(user_params)
      flash[:notice] = 'El usuario ha sido actualizado correctamente'
    else
      flash[:alert] = 'Ocurrió un error intentando actualizar el usuario. Revise los datos ingresados. Nombre y correo son obligatorios.'
    end

    # Si se realizó un cambio de contraseña de forma exitosa,
    # se cierra la sesión actual y se redirige al formulario
    # de inicio de sesión; de lo contrario, se mantiene la
    # página actual.
    if user_params[:password].to_s.strip.empty?
      redirect_to edit_admin_user_path(@user)
    else
      log_out if logged_in?
      redirect_to login_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def find_user
    @user = User.find(params[:id])
  end
end
