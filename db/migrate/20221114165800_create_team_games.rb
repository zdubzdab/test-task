# frozen_string_literal: true

class CreateTeamGames < ActiveRecord::Migration[5.0]
  def change
    create_table(:team_games) do |t|
      t.references(:team, foreign_key: true, null: false)
      t.references(:game, foreign_key: true, null: false)
      t.boolean(:win, null: false)

      # game can have one winner and one looser
      t.index([:game_id, :win], unique: true)
      t.timestamps
    end
  end
end
