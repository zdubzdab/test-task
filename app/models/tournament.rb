# frozen_string_literal: true

class Tournament < ApplicationRecord
  has_many :tournament_teams, dependent: :destroy
  has_many :teams, through: :tournament_teams
  has_many :games, dependent: :destroy # maybe change into has_many :games, through: :divisins
  has_many :divisions, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validates :status, presence: true

  enum status: {draft: "draft", in_progress: "in_progress", done: "done"}

  def space_for_team?(team)
    free_space? && does_not_have_team?(team)
  end

  private

    def does_not_have_team?(team)
      teams.exclude?(team)
    end

    def free_space?
      teams.count < 16
    end
end
