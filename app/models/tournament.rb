# frozen_string_literal: true

class Tournament < ApplicationRecord
  REQUIRED_NUMBER_OF_TEAMS_TO_START = 16

  STATUSES = [DRAFT = "draft", IN_PROGRESS = "in_progress", DONE = "done"].freeze

  has_many :tournament_teams, dependent: :destroy
  has_many :teams, through: :tournament_teams
  has_many :games, dependent: :destroy
  has_many :divisions, dependent: :destroy
  has_one :playoff, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validates :status, presence: true, inclusion: {in: STATUSES}

  enum status: {draft: DRAFT, in_progress: IN_PROGRESS, done: DONE}

  def space_for_team?(team)
    free_space? && does_not_have_team?(team)
  end

  def ready_to_start?
    teams.count == REQUIRED_NUMBER_OF_TEAMS_TO_START
  end

  def team_name_with_place(place)
    teams.includes(:tournament_teams).where(tournament_teams: {place: place})&.
      first&.
      name
  end

  private

    def does_not_have_team?(team)
      teams.exclude?(team)
    end

    def free_space?
      teams.count < REQUIRED_NUMBER_OF_TEAMS_TO_START
    end
end
