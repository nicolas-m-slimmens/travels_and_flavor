class SubscriberController < ApplicationController

  def create
    begin
      mail = Subscriber.new(subscriber_params)
      if mail.save(subscriber_params)
        flash[:notice] = 'Dirección de correo registrada con exito'
        redirect_to :back
      else
        flash[:alert] = 'Error al registrar su dirección de correo'
        redirect_to :back
      end
    rescue ActiveRecord::RecordNotUnique
      flash[:alert] = 'La dirección de correo ingresada ya se encuentra registrada'
      redirect_to :back
    end
  end

  private

  def subscriber_params
    params.require(:subscriber).permit(:mail)
  end

end
