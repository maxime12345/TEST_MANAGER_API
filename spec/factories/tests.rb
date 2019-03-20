# frozen_string_literal: true

FactoryBot.define do
  factory :test do
    name 'new test'
    status '%w[undefined passed failed].sample'
  end
end
