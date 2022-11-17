# frozen_string_literal: true

module CategoryEnum
  extend ActiveSupport::Concern

  CATEGORIES = [A = "A", B = "B"].freeze

  included do
    enum category: {A: A, B: B}

    validates :category, presence: true, inclusion: {in: CATEGORIES}
  end
end

