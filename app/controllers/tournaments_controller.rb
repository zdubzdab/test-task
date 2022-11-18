# frozen_string_literal: true

class TournamentsController < ApplicationController
  helper_method :tournaments, :all_teams, :tournament

  def index
    @new_tournament = Tournament.new
  end

  def create
    # rubocop:disable Rails/SaveBang
    @new_tournament = Tournament.create(tournament_params)
    # rubocop:enable Rails/SaveBang
    render :index
  end

  def show; end

  def edit
    @new_team = Team.new
  end

  def start
    TournamentStarter.call(tournament)

    redirect_back(fallback_location: tournament_path(tournament))
  end

  def generate_result
    ResultsGenerator.call(tournament)

    redirect_back(fallback_location: tournament_path(tournament))
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
