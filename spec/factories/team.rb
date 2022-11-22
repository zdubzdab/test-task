# frozen_string_literal: true

FactoryBot.define do
  factory :team do
    sequence(:name) { |n| "Name#{ n }" }
  end
end
