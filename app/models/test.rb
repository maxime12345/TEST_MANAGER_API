# frozen_string_literal: true

class Test < ApplicationRecord
  belongs_to :feature
  validates :name, presence: true
  validates :status, inclusion: { in: %w[undefined passed failed] }, presence: true
end
