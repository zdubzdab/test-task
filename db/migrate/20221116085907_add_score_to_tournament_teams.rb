# frozen_string_literal: true

class AddScoreToTournamentTeams < ActiveRecord::Migration[5.0]
  def change
    add_column(:tournament_teams, :score, :integer, default: 0, null: false)
  end
end
