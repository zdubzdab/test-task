# frozen_string_literal: true

class Division < ApplicationRecord
  CATEGORIES = [A = "A", B = "B"].freeze

  has_many :division_teams, dependent: :destroy
  has_many :teams, through: :division_teams

  belongs_to :tournament

  enum category: {a: "A", b: "B"}

  validates :category, presence: true, inclusion: {in: CATEGORIES}
end
