# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'TestApis', type: :request do
  describe 'GET /tests_apis' do
    it 'returns a 200 response' do
      get api_v1_tests_path
      expect(response).to have_http_status(200)
    end

    it 'loads list of tests' do
      5.times { FactoryBot.create(:test) }
      get api_v1_tests_path
      expect(response).to have_http_status(:success)
      json = JSON.parse(response.body)
      expect(json['data'].length).to eq 5
    end

    it 'loads one test' do
      test = FactoryBot.create(:test)
      get api_v1_test_path(id: test.id)
      expect(response).to have_http_status(:success)
      json = JSON.parse(response.body)
      expect(json['data']['id']).to eq test.id
    end
  end

  describe 'POST /tests_apis' do
    it 'create a test' do
      feature = FactoryBot.create(:feature)
      FactoryBot.create(:test)
      test_attributes = FactoryBot.attributes_for(:test)
      expect do
        post api_v1_tests_path, params: {
          test: test_attributes,
          feature_id: feature.id
        }
      end.to change(Test, :count).by(1)

      expect(response).to have_http_status(:success)
    end
  end

  describe 'PUT /tests_apis' do
    it 'update a test' do
      test = FactoryBot.create(:test)

      put api_v1_test_path(id: test.id), params: {
        test: { status: 'passed' }
      }

      get api_v1_test_path(id: test.id)

      json = JSON.parse(response.body)

      expect(json['data']['status']).to eq 'passed'
      expect(response).to have_http_status(:success)
    end
  end
end
