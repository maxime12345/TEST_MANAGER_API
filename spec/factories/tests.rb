# frozen_string_literal: true

FactoryBot.define do
  factory :test do
    name { 'new test' }
    status { 'undefined' }
    association :feature
  end
end
