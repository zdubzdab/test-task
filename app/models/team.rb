# frozen_string_literal: true

class Team < ApplicationRecord
  has_many :tournament_teams, dependent: :destroy
  has_many :tournaments, through: :tournament_teams
end
