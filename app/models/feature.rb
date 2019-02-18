# frozen_string_literal: true

class Feature < ApplicationRecord
  validates :name, presence: true
  has_many :tests, dependent: :destroy
end
