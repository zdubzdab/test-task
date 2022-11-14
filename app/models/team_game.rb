# frozen_string_literal: true

class TeamGame < ApplicationRecord
  belongs_to :team
  belongs_to :game
end
