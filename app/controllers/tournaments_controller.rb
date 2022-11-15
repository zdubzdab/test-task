# frozen_string_literal: true

class TournamentsController < ApplicationController
  helper_method :tournaments, :all_teams, :tournament

  def index
    @new_tournament ||= Tournament.new
  end

  def create
    @new_tournament = Tournament.create(tournament_params)

    render :index
  end

  def show
    @new_team ||= Team.new
  end

  private

    def tournament_params
      params.require(:tournament).permit(:name)
    end

    def tournaments
      @tournaments ||= Tournament.all
    end

    def tournament
      @tournament ||= Tournament.find(params[:id])
    end

    def all_teams
      @all_teams ||= Team.all
    end
end
