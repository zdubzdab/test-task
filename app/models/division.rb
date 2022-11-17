# frozen_string_literal: true

class Division < ApplicationRecord
  include CategoryEnum

  has_many :division_teams, dependent: :destroy
  has_many :teams, through: :division_teams

  belongs_to :tournament
end
