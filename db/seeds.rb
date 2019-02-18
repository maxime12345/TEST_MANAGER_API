# frozen_string_literal: true

5. times do
  Feature.create(
    name: Faker::Lorem.sentence(5)
  )
end
