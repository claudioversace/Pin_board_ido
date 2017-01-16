class PinsController < ApplicationController
  before_action :find_pin, only:[:show, :edit, :update, :destroy]

  def index
    @pins = Pin.all.order("created_at DESC")
  end

  def show
    #code
  end

  def new
    @pin = current_user.pins.build
  end

  def create
    @pin = current_user.pins.build(pin_params)

    if @pin.save
      redirect_to @pin, notice: "Création reussie du nouveau Pin"
    else
      render 'new'
    end
  end

  def edit
    #code
  end

  def update
    if @pin.update(pin_params)
      redirect_to @pin, notice: "Pin a été bien mis à jour!"
    else
      render 'edit'
    end
  end

  def destroy
    @pin = @pin.destroy
    redirect_to root_path
  end

  private

  def pin_params
    params.require(:pin).permit(:title, :description, :image)
  end

  def find_pin
    @pin = Pin.find(params[:id])
  end
end
