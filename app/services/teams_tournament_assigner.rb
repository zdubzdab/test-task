# frozen_string_literal: true

class TeamsTournamentAssigner
  def initialize(team_params)
    @tournament = Tournament.find_by(id: team_params[:tournament_id])
    @team = Team.find_by(id: team_params[:team_id])
  end

  def call
    return unless tournament.space_for_team?(team)

    team.tournaments << tournament

    team.save!
  end

  private

    attr_reader :tournament, :team
end
