# frozen_string_literal: true

class Playoff < ApplicationRecord
  has_many :playoff_teams, dependent: :destroy
  has_many :teams, through: :playoff_teams
  has_many :divisions, through: :tournament
  has_many :games, dependent: nil

  belongs_to :tournament
end
