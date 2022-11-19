# frozen_string_literal: true

class AddScoreToTeamGames < ActiveRecord::Migration[5.0]
  def change
    add_column(:team_games, :score, :integer)
  end
end
