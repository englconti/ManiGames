class RentsController < ApplicationController
  before_action :set_rent, only: %i[show edit update]

  def new
    @game = Game.find(params[:game_id])
    @rent = Rent.new

    # adding for geocode:
    @marker = [{ lat: @game.latitude, lng: @game.longitude }]
  end

  def create
    @rent = Rent.new(rent_params)

    @game = Game.find(params[:game_id])
    @rent.game = @game
    @rent.price = (@rent.end_date - @rent.start_date).to_i * @rent.game.daily_rent

    @rent.user = current_user

    if @rent.save
      # Verificar essa rota para user_path(@rent.user)
      # A ideia é direcionar o usuário para sua página inicial após fazer a reserva.
      redirect_to user_path(@rent.user), notice: 'Rent was successfully created.'
    else
      # Render é diferent de redirect_to porque ele não atualiza a página.
      # Dessa forma o usuário não perde as informações digitadas no formulário.
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    # Foi decidido que o owner não poderá escolher se aceita ou não a proposta de aluguel.
    # A partir do momento que o renter fez a solicitação, o jogo fica indisponível durante as datas solicitadas.
    # 1. rent.game.available = false (para o periodo informado (rent.end_date - rent.start_date))

    # Criar uma regra para verificar se as datas estão disponíveis para aluguel
    dates_validation = true

    if @rent.update(rent_params) & dates_validation
      redirect_to @rent, notice: 'Rent was successfully updated.'
    else
      render :edit
    end
  end

  private

  def set_rent
    @rent = Rent.find(params[:id])
  end

  def rent_params
    params.require(:rent).permit(:start_date, :end_date)
  end
end
