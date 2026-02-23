class PlacesController < ApplicationController
  def index
    @places = Place.all
  end

  def show
    @place = Place.find(params[:id])
    @entries = @place.entries
  end

  def new
    @place = Place.new
  end

  def create
    @place = Place.new(place_params)
    if @place.save
      redirect_to places_path
    else
      render :new
    end
  end

  private

  def place_params
    params.require(:place).permit(:name)
  end
end

def create
  @place = Place.new
  @place["name"] = params["name"] # This "name" matches the 'name' attribute in your form input
  @place.save
  redirect_to "/places" # Sends the user back to the list after saving
end