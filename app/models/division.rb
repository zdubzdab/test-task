# frozen_string_literal: true

class Division < ApplicationRecord
  CATEGORIES = [A = "A", B = "B"].freeze

  has_many :division_teams, dependent: :destroy
  has_many :teams, through: :division_teams
  has_many :tournament_teams, through: :teams
  has_many :games, dependent: nil

  belongs_to :tournament

  enum category: {A: A, B: B}

  validates :category, presence: true, inclusion: {in: CATEGORIES}

  def best_teams_first(number)
    # limit(4) doesn't work correctly here
    teams.
      includes(:division_teams).
      order("division_teams.score desc").
      to_a.
      first(number)
  end

  def best_teams
    teams.includes(:division_teams).order("division_teams.score desc")
  end
end
