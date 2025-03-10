class PlayersController < ApplicationController
  def index
    players = Player.all
    render json: players
  end

  def create
    player = Player.new(player_params)
    if player.save
      render json: player, status: :created
    else
      render json: { error: player.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def player_params
    params.require(:player).permit(:name, :skill_level)
  end
end
