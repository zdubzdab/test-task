# frozen_string_literal: true

class Playoff < ApplicationRecord
  include CategoryEnum

  belongs_to :tournament
end
