# frozen_string_literal: true

class AddPlayoffToGames < ActiveRecord::Migration[5.0]
  def change
    add_reference(:games, :playoff, foreign_key: true)
  end
end
