# frozen_string_literal: true

class AddScoreToGames < ActiveRecord::Migration[5.0]
  def change
    change_table(:games, bulk: true) do |t|
      t.integer(:loser_score)
      t.integer(:winner_score)
    end
  end
end
