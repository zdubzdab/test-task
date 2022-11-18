# frozen_string_literal: true

module GameResultGenerator
  extend self
  # array_with_teams eg. [team_1, team_2]
  # tournament_stage can be division or playoff
  def call(array_with_teams, tournament_stage, tournament)
    winner = array_with_teams[rand(2)]
    loser = (array_with_teams - [winner]).first
    ActiveRecord::Base.transaction do
      game = Game.create!(
        :tournament => tournament,
        tournament_stage.class.to_s.underscore => tournament_stage
)

      winner.team_games.create!(game: game, win: true)
      loser.team_games.create!(game: game, win: false)

      tournament_team = winner.tournament_team_by_tournament_id(tournament.id).first
      tournament_team.score += 1
      tournament_team.save!
    end

    { winner: winner, loser: loser }
  end
end
