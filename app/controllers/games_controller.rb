class GamesController < ApplicationController
  before_action :set_game, only: [:show, :edit, :update, :destroy]

  def index
    @games = Game.all
  end

  def show
  end

  def receive
  end

  private
    def set_game
      @game = Game.find(params[:id])
    end
end
