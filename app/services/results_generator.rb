# frozen_string_literal: true

module ResultsGenerator
  extend self

  def call(tournament)
    if tournament.games.empty?
      DivisionsResultsGenerator
    else
      # PlayoffResultsGenerator
    end.new(tournament).call
  end
end
