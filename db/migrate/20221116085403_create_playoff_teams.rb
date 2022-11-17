# frozen_string_literal: true

class CreatePlayoffTeams < ActiveRecord::Migration[5.0]
  def change
    create_table(:playoff_teams) do |t|
      t.references(:team, foreign_key: true, null: false)
      t.references(:playoff, foreign_key: true, null: false)
      t.integer(:playoff_stage, default: 0)

      t.timestamps
    end
  end
end
