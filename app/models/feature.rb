# frozen_string_literal: true

class Feature < ApplicationRecord
  validates :name, presence: true
end
