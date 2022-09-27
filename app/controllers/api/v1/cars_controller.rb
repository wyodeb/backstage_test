module Api
  module V1
    class CarsController < ApplicationController
      before_action :set_car, only: [:show, :update, :destroy]
      include CarBuilder

      def index
        @cars = Car.where(nil)
        @cars = Car.filter(params.slice(:make, :min_price, :max_price))
        building_cars(@cars)
      end

      def show; end

      # POST /cars
      def create
        @car = Car.new(car_params)
        if @car.save
          render json: :created, status: :created
        else
          render json: @car.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /cars/1
      def update
        if @car.update(car_params)
          render json: :updated, status: :ok
        else
          render json: @car.errors, status: :unprocessable_entity
        end
      end

      # DELETE /cars/1
      def destroy
        @car.destroy
        render json: :no_content, status: :no_content
      end

      private
      def set_car
        @car = Car.friendly.find(params[:id])
      end

      def car_params
        params.require(:car).permit(:make, { colors: [] },:price, :unit, :distance, :model, :currency, :photo)
      end
    end
  end
end

