# frozen_string_literal: true

(1..5).each do |i|
  feature = Feature.create(name: "Feature #{i}")
  (1..rand(2..9)).each do |j|
    Test.create(
      feature_id: feature.id,
      name: "Test #{j}",
      status: %w[undefined passed failed].sample
    )
  end
end
