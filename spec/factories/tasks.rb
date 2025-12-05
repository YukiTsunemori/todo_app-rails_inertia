# frozen_string_literal: true

FactoryBot.define do
  factory :task do
    name { "MyString" }
    memo { "MyText" }
    completed_at { nil }
    deadline_at { 2.days.from_now }
    association :user
  end
end
