# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Test, type: :model do
  context 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:status) }
    it { should validate_inclusion_of(:status).in_array(%w[undefined passed failed]) }
  end

  context 'associations' do
    it { should belong_to(:feature) }
  end
end
