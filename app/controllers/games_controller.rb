class GamesController < ApplicationController
  before_action :set_game, only: %i[show edit update destroy]

  def index
    @games = Game.all
  end

  def show; end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)
    @game.user = current_user

    if @game.save
      redirect_to user_path(current_user), notice: "Game successfully added"
    else
      render :new
    end
  end

  def edit; end

  def update
    if @game.update(game_params)
      redirect_to @game, notice: 'Game successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    if @game.destroy
      redirect_to user_path(current_user)
    # @user = @game.user
    end
  end

  private

  def game_params
    params.require(:game).permit(:title, :brand, :console, :gamecover, :released_year, :daily_rent, :min_rent_period)
  end

  def set_game
    @game = Game.find(params[:id])
  end
end
