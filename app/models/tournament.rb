# frozen_string_literal: true

class Tournament < ApplicationRecord
  enum status: {
    draft: "draft",
    in_progress: "in_progress",
    done: "done"
  }
end
