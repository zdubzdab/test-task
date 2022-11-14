# frozen_string_literal: true

class DivisionTeam < ApplicationRecord
  belongs_to :team
  belongs_to :division
end
