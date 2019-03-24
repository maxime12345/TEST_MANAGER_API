# frozen_string_literal: true

module Api
  module V1
    class TestsController < ApplicationController
      def index
        @tests = Test.all
        render json: { status: 'SUCCESS', message: 'Loaded features', data: @tests }, status: :ok
      end

      def show
        @test = Test.find(params[:id])
        render json: { status: 'SUCCESS', message: 'Loaded features', data: @test }, status: :ok
      end

      def create
        @test = Test.new(test_params)
        @test.feature = Feature.find(params[:feature_id])
        if @test.save
          render json: { status: 'SUCCESS', message: 'Saved test', data: @test }, status: :ok
        else
          render json: { status: 'ERROR', message: 'Test not saved', data: @test.errors },
                 status: :unprocessable_entity
        end
      end

      def update
        @test = Test.find(params[:id])
        if @test.update_attributes(test_status_params)
          render json: { status: 'SUCCESS', message: 'Updated test', data: @test }, status: :ok
        else
          render json: { status: 'ERROR', message: 'Test not updated', data: @test.errors },
                 status: :unprocessable_entity
        end
      end

      private

      def test_status_params
        params.require(:test).permit(:status)
      end

      def test_params
        params.require(:test).permit(:name, :status)
      end
    end
  end
end
