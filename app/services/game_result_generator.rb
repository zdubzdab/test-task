# frozen_string_literal: true

module GameResultGenerator
  extend self
  # array_with_teams eg. [team_1, team_2]
  # tournament_stage can be division or playoff
  def call(array_with_teams, tournament_stage, tournament)
    winner = array_with_teams[rand(2)]
    loser = (array_with_teams - [winner]).first

    winner_goals = rand(1..7)
    loser_goals = rand(0..(winner_goals - 1))

    ActiveRecord::Base.transaction do
      game = Game.create!(
        :tournament => tournament,
        tournament_stage.class.to_s.underscore => tournament_stage
)

      winner.team_games.create!(game: game, win: true, score: winner_goals)
      loser.team_games.create!(game: game, win: false, score: loser_goals)

      tournament_team = winner.tournament_team_by_tournament_id(tournament.id).first
      tournament_team.score += 1
      tournament_team.save!

      if tournament_stage.instance_of?(Division)
        division_team =
          winner.division_team_by_division_id(tournament_stage.id).first
        division_team.score += 1
        division_team.save!
      end
    end

    {winner: winner, loser: loser}
  end
end
