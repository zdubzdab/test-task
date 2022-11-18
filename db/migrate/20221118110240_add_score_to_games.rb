class AddScoreToGames < ActiveRecord::Migration[5.0]
  def change
    add_column :games, :loser_score, :integer
    add_column :games, :winner_score, :integer
  end
end
