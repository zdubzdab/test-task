# frozen_string_literal: true

class Game < ApplicationRecord
  has_many :team_games, dependent: :destroy
  has_many :teams, through: :team_games

  belongs_to :tournament
  belongs_to :division
  belongs_to :playoff
end
