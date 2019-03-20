# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Feature, type: :model do
  context 'validations' do
    it { should validate_presence_of(:name) }
  end

  context 'associations' do
    it { should have_many(:tests) }
  end
end
