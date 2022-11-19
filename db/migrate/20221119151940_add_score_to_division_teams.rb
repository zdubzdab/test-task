# frozen_string_literal: true

class AddScoreToDivisionTeams < ActiveRecord::Migration[5.0]
  def change
    add_column(:division_teams, :score, :integer, default: 0)
  end
end
