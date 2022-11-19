# frozen_string_literal: true

class Team < ApplicationRecord
  has_many :tournament_teams, dependent: :destroy
  has_many :tournaments, through: :tournament_teams

  has_many :team_games, dependent: :destroy
  has_many :games, through: :team_games
  has_many :divisions, through: :games
  has_many :division_teams, dependent: nil

  validates :name, presence: true, uniqueness: true

  def tournament_team_by_tournament_id(tournament_id)
    tournament_teams.where(tournament_id: tournament_id)
  end

  def division_team_by_division_id(division_id)
    division_teams.where(division_id: division_id)
  end
end
