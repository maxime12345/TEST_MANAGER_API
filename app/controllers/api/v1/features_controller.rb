# frozen_string_literal: true

module Api
  module V1
    class FeaturesController < ApplicationController
      def index
        @features = Feature.all
        result = { "status": 'SUCCESS', "message": 'Loaded features' }
        result['data'] = @features.map do |feature|
          {
            "id": feature.id,
            "name": feature.name,
            "tests": feature.tests.map(&:id)
          }
        end
        render json: result
      end

      def show
        @feature = Feature.find(params[:id])
        render json: @feature, status: :ok
      end

      def create
        @feature = Feature.new(feature_params)
        if @feature.save
          render json: { status: 'SUCCESS', message: 'Saved feature', data: @feature }, status: :ok
        else
          render json: { status: 'ERROR', message: 'Feature not saved', data: @feature.errors },
                 status: :unprocessable_entity
        end
      end

      private

      def feature_params
        params.require(:feature).permit(:name)
      end
    end
  end
end
