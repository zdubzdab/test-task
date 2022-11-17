# frozen_string_literal: true

class DivisionsResultsGenerator
  def initialize(tournament, generator: GameResultGenerator)
    @tournament = tournament
    @generator = generator
  end

  def call
    tournament.divisions.each { |d| generate_results(d) }
  end

  private

    attr_reader :tournament, :generator

    def generate_results(division)
      division.teams.to_a.combination(2).to_a.each do |teams|
        generator.call(teams, division, tournament)
      end
    end
end
