class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]
  before_action :redirect_user, only: [:destroy]

  # GET /restaurants
  # GET /restaurants.json
  def index
  if params[:search]
  
   @restaurants = Restaurant.search(params[:search])
   else
    @restaurants = Restaurant.all
    end
  end

  # GET /restaurants/1
  # GET /restaurants/1.json
  def show
  end

  # GET /restaurants/new
  def new
    @restaurant = Restaurant.new
  end

  # GET /restaurants/1/edit
  def edit
  end

  # POST /restaurants
  # POST /restaurants.json
  def create
    @restaurant = Restaurant.new(restaurant_params)

    respond_to do |format|
      if @restaurant.save
        format.html { redirect_to '/restaurants', notice: 'Restaurant was successfully created.' }
        format.json { render :show, status: :created, location: @restaurant }
      else
        format.html { render :new }
        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /restaurants/1
  # PATCH/PUT /restaurants/1.json
  def update
    respond_to do |format|
      if @restaurant.update(restaurant_params)
        format.html { redirect_to @restaurant, notice: 'Restaurant was successfully updated.' }
        format.json { render :show, status: :ok, location: @restaurant }
      else
        format.html { render :edit }
        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /restaurants/1
  # DELETE /restaurants/1.json
  def destroy
    @restaurant.destroy
    respond_to do |format|
      format.html { redirect_to restaurants_url, notice: 'Restaurant was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def vote_for_splitting
     @restaurant = Restaurant.find(params[:id])
     @restaurant.increment!(:votes_for_splitting, amount = 1)
     determine_average
     redirect_to :restaurants
  end
  
  def vote_against_splitting
     @restaurant = Restaurant.find(params[:id])
     @restaurant.increment!(:votes_against_splitting, amount = 1)
     determine_average
     redirect_to :restaurants
  end
  
  def determine_average

@average = (Restaurant.where(id: params[:id]).pluck(:votes_for_splitting)[0].to_f / (Restaurant.where(id: params[:id]).pluck(:votes_for_splitting)[0].to_i + Restaurant.where(id: params[:id]).pluck(:votes_against_splitting)[0].to_i)) * 100

@restaurant.update_column(:splitting_average, @average)
   end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_restaurant
      @restaurant = Restaurant.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def restaurant_params
      params.require(:restaurant).permit(:name, :location, :votes_for_splitting, :votes_against_splitting, :splitting_average)
    end
end
