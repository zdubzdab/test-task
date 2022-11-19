# frozen_string_literal: true

class AddPlaceToTournamentTeams < ActiveRecord::Migration[5.0]
  def change
    add_column(:tournament_teams, :place, :integer, default: 9)
  end
end
