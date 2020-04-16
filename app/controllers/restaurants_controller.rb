class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]
  before_action :redirect_user, only: [:destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :vote_for_restaurant, :vote_against_restaurant]

  # GET /restaurants
  # GET /restaurants.json
  def index
  if params[:search]
  
   @restaurants = Restaurant.search(params[:search])
   @count = @restaurants.size
    if @restaurants.size == 0
    
    flash.now[:notice] = "No restaurants match the search criteria."
    
    elsif @restaurants.size == 1
    
    flash.now[:notice] = "There is 1 result."
    
    elsif @restaurants.size > 1
    
    flash.now[:notice] = "There are #{@count} results."
        
    end
   
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
        format.html { redirect_to '/restaurants', notice: 'Restaurant was successfully updated.' }
        
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
  
 
  
  #Adds new vote for restaurant splitting the check
  def vote_for_restaurant
    @restaurant = Restaurant.find(params[:id])
    @user = current_user

    @vote = @restaurant.votes.create(restaurant_id: @restaurant.id, for_splitting:true, user_id: @user.id)

    @restaurant.save!
    redirect_to :restaurants
  end
  
  #Adds new vote for restaurant not splitting the check
  def vote_against_restaurant
    @restaurant = Restaurant.find(params[:id])
    @user = current_user

    @vote = @restaurant.votes.create(restaurant_id: @restaurant.id, for_splitting:false, user_id: @user.id)

    @restaurant.save!
    redirect_to :restaurants
  end

  #Determines average amount users vote yes on splitting for a restaurant
  def get_average_votes_for_restaurant(restaurant_id)
    @restaurant = Restaurant.find(restaurant_id)
    @average = 0

    @yes = @restaurant.votes.where(for_splitting: true).size
    @no = @restaurant.votes.where(for_splitting: false).size
    
    if (@yes + @no) > 0
      @average = (@yes.to_f / (@yes.to_f + @no.to_f)) * 100
    else
      @average = 0
    end
    @average
   end
   helper_method :get_average_votes_for_restaurant
  
  
  private
  
  #Updates average
 

 
   
    # Use callbacks to share common setup or constraints between actions.
    def set_restaurant
      @restaurant = Restaurant.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def restaurant_params
      params.require(:restaurant).permit(:name, :location)
    end
end
