# frozen_string_literal: true

class TeamsController < ApplicationController
  def create
    TeamCreator.new(team_params).call

    redirect_back(fallback_location: tournament_path(tournament))
  end

  def update
    TeamsTournamentAssigner.new(team_params).call

    redirect_back(fallback_location: tournament_path(tournament))
  end

  private

    def team_params
      params.require(:team).permit(:name, :generate_random, :tournament_id, :team_id)
    end

    def tournament
      @tournament ||= Tournament.find(params[:tournament_id])
    end
end
