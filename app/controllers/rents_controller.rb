class RentsController < ApplicationController
  before_action :set_rent, only: %i[show edit update]

  def new
    @rent = Rent.new
  end

  def create
    @rent = Rent.new(rent_params)

    # Calculo do preço do Rent - *** VERIFICAR(Depois de pronto criar um método específico para isso.)
    @rent.price = (@rent.end_date - @rent.start_date) * @rent.game.daily_rent

    if @rent.save
      # Verificar essa rota para user_path(@rent.user) -> A ideia é direcionar o usuário para sua página inicial após fazer a reserva.
      redirect_to user_path(@rent.user), notice: 'Rent was successfully created.'
    else
      # Estou na dúvida do que é esse comando.
      render :new
    end
  end

  def show; end

  def edit; end

  def update; end

  private

  def set_rent
    @rent = Rent.find(params[:id])
  end

  def rent_params
    params.require(:rent).permit(:start_date, :end_date)
  end
end
