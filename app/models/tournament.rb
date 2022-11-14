# frozen_string_literal: true

class Tournament < ApplicationRecord
  has_many :tournament_teams, dependent: :destroy
  has_many :teams, through: :tournament_teams
  has_many :games, dependent: :destroy # maybe change into has_many :games, through: :divisins
  has_many :divisions, dependent: :destroy

  enum status: {draft: "draft", in_progress: "in_progress", done: "done"}
end
