require Rails.root.join("app/services/scheduler_service.rb")

class SchedulesController < ApplicationController
  skip_forgery_protection

  def create
    players = Player.all
    if players.count < 16
      render json: { error: "Not enough players to generate a schedule (need 16)" }, status: :unprocessable_entity
      return
    end

    begin
      schedule = SchedulerService.new(players).generate_schedule
      render json: schedule
    rescue StandardError => e
      render json: { error: e.message, backtrace: e.backtrace.first(5) }, status: :internal_server_error
    end
  end
end
