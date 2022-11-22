# frozen_string_literal: true

FactoryBot.define do
  factory :playoff do
    trait :with_tournament do
      tournament { create(:tournament) }
    end
  end
end
