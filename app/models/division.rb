# frozen_string_literal: true

class Division < ApplicationRecord
  CATEGORIES = [A = "A", B = "B"].freeze

  has_many :division_teams, dependent: :destroy
  has_many :teams, through: :division_teams
  has_many :tournament_teams, through: :teams
  has_many :games, through: :teams

  belongs_to :tournament

  enum category: {A: A, B: B}

  validates :category, presence: true, inclusion: {in: CATEGORIES}

  def best_teams
    # limit(4) doesn't work correctly here
    teams.
      includes(:tournament_teams).
      order("tournament_teams.score desc").
      to_a.
      first(4)
  end
end
