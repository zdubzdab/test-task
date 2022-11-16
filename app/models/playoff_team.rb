# frozen_string_literal: true

class PlayoffTeam < ApplicationRecord
  belongs_to :team
  belongs_to :playoff
end
