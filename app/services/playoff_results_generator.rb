# frozen_string_literal: true

class PlayoffResultsGenerator
  def initialize(tournament, generator: GameResultGenerator)
    @tournament = tournament
    @generator = generator
  end

  def call
    ActiveRecord::Base.transaction do
      @playoff = Playoff.create!(tournament_id: tournament.id)
      # first_playoff_round
      first_division_results = get_winners_losers(
        play_first_playoff_round(tournament.divisions.first.best_teams)
      )
      second_division_results = get_winners_losers(
        play_first_playoff_round(tournament.divisions.last.best_teams)
      )

      tournament_teams_sorted(
        first_division_results[:losers] + second_division_results[:losers]
      ).each_with_index do |tournament_team, index|
        tournament_team.update!(place: (index + 5))
      end
      # second_playoff_round
      second_playoff_first_game = generator.call(
        first_division_results[:winners], playoff,
        tournament
      )
      second_playoff_second_game = generator.call(
        second_division_results[:winners], playoff,
        tournament
      )
      tournament_teams = [
        second_playoff_first_game[:loser],
        second_playoff_second_game[:loser]
      ]
      tournament_teams_sorted(
        tournament_teams
      ).each_with_index do |tournament_team, index|
        tournament_team.update!(place: (index + 3))
      end
      # final
      finalists = [
        second_playoff_first_game[:winner],
        second_playoff_second_game[:winner]
      ]
      save_finalists_places(generator.call(finalists, playoff, tournament))

      tournament.update!(status: Tournament::DONE)
    end
  end

  private

    attr_reader :tournament, :generator, :playoff

    def play_first_playoff_round(teams)
      first_game_result = generator.call([teams[0], teams[3]], playoff, tournament)
      second_game_result = generator.call([teams[1], teams[2]], playoff, tournament)

      [first_game_result, second_game_result]
    end

    def get_winners_losers(teams)
      winners = []
      losers = []
      teams.each do |hash|
        winners << hash[:winner]
        losers << hash[:loser]
      end

      {winners: winners, losers: losers}
    end

    def tournament_teams_sorted(tournament_teams)
      tournament_teams.each_with_object([]) do |team, memo|
        memo << team.tournament_team_by_tournament_id(tournament.id)
      end.flatten.sort_by(&:score).reverse
    end

    def save_finalists_places(final)
      loser_tournament_team =
        final[:loser].tournament_team_by_tournament_id(tournament.id).first
      loser_tournament_team.update!(place: 2)

      winner_tournament_team =
        final[:winner].tournament_team_by_tournament_id(tournament.id).first
      winner_tournament_team.update!(place: 1)
    end
end
