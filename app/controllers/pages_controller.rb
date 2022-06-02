class PagesController < ApplicationController
  def home
    @games = Game.all
    # the `geocoded` scope filters only games with coordinates (latitude & longitude)
    @markers = @games.geocoded.map do |game|
      { lat: game.latitude, lng: game.longitude }
    end
  end
end
