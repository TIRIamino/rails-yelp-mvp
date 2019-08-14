class RestaurantsController < ApplicationController

  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]

  # GET /restaurants
  def index
    @restaurants = Restaurant.all
  end

  # GET /restaurants/:id
  def show
    # @restaurant = Restaurant.find(params[:id])
  end

  # GET /restaurants/new
  def new
    @restaurant = Restaurant.new
  end

  # POST /restaurants
  def create
    restaurant = Restaurant.new(restaurant_params)
    # restaurant = Restaurant.new(params[:restaurant])
      # => will raise an ActiveRecord::ForbiddenAttributesError
    restaurant.save

    redirect_to restaurants_path
  end

  # GET /restaurants/:id/edit
  def edit
    # @restaurant = Restaurant.find(params[:id])
  end

  # PATCH /restaurants/:id
  def update
    # @restaurant = Restaurant.find(params[:id])
    @restaurant.update(restaurant_params)

    redirect_to restaurant_path(@restaurant)
  end

  # DELETE /restaurants/:id
  def destroy
    # @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy

    redirect_to restaurants_path
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone, :category)
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end
end
