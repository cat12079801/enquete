class GamesController < ApplicationController
  before_action :set_game, only: [:show, :edit, :update, :destroy]

  def index
    @games = Game.all
  end

  def show
    @collect = Collect.new
  end

  def receive
    @collect = Collect.new(collect_params)
    @collect.impressions = params[:collect][:impressions][0]
    @collect.game_id = params[:id]
    if params[:collect][:know].present?
      params[:collect][:know].each do |key, value|
        if @collect.know.nil?
          @collect.know = key.to_s
        else
          @collect.know = @collect.know + ',' + key.to_s
        end
      end
    end

    hoge = []
    Collect.where(:guest_name => @collect.guest_name).each do |piyo|
      hoge.push(piyo.game_id)
    end
    @games = Game.where.not(:id => hoge)
    respond_to do |format|
      if @collect.save
        format.html {  }
        format.json { render :show, status: :created, location: @collect }
      else
        format.html { render :show }
        format.json { render json: @collect.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_game
      @game = Game.find(params[:id])
    end

    def collect_params
      params.require(:collect).permit(:evaluation, :guest_name, :impressions, :most_fav, :want_game, :where_c3, :shourai, :kit, :know)
    end
end
