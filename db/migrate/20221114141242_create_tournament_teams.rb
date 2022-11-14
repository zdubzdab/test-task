# frozen_string_literal: true

class CreateTournamentTeams < ActiveRecord::Migration[5.0]
  def change
    create_table(:tournament_teams) do |t|
      t.references(:team, foreign_key: true, null: false)
      t.references(:tournament, foreign_key: true, null: false)

      t.index([:team_id, :tournament_id], unique: true)
      t.timestamps
    end
  end
end
