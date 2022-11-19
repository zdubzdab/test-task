# frozen_string_literal: true

class AddScoreToTournamentTeams < ActiveRecord::Migration[5.0]
  def change
    change_table(:tournament_teams, bulk: true) do |t|
      t.integer(:score, default: 0, null: false)
      t.index(:score)
    end
  end
end
