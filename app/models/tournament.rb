# frozen_string_literal: true

class Tournament < ApplicationRecord
  has_many :tournament_teams, dependent: :destroy
  has_many :teams, through: :tournament_teams

  enum status: {draft: "draft", in_progress: "in_progress", done: "done"}
end
