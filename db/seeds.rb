# frozen_string_literal: true

5. times do
  feature = Feature.create(name: Faker::Lorem.sentence(5))
  rand(2..9).times do
    Test.create(
      feature_id: feature.id,
      name: Faker::Lorem.sentence(5),
      status: %w[undefined passed failed].sample
    )
  end
end
