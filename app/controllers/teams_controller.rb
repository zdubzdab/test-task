# frozen_string_literal: true

class TeamsController < ApplicationController
  def create
    Team.create(team_params)

    redirect_back(fallback_location: tournament_path(tournament))
  end

  private

    def team_params
      params.require(:team).permit(:name)
    end

    def tournament
      @tournament ||= Tournament.find(params[:tournament_id])
    end
end
