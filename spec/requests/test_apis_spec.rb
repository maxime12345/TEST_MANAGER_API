require 'rails_helper'

RSpec.describe "TestApis", type: :request do
  describe 'GET /features_apis' do
    it 'returns a 200 response' do
      get api_v1_tests_path
      expect(response).to have_http_status(200)
    end

    # it 'loads list of features' do
    #   5.times { FactoryBot.create(:feature) }
    #   get api_v1_features_path
    #   expect(response).to have_http_status(:success)
    #   json = JSON.parse(response.body)
    #   expect(json['data'].length).to eq 5
    # end

    # it 'loads one feature' do
    #   feature = FactoryBot.create(:feature)
    #   get api_v1_feature_path(id: feature.id)
    #   expect(response).to have_http_status(:success)
    #   json = JSON.parse(response.body)
    #   expect(json['feature']['id']).to eq feature.id
    # end
  end
end
