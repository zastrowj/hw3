class EntriesController < ApplicationController
  def new
    @place = Place.find(params[:place_id]) if params[:place_id]
    @entry = Entry.new(place_id: @place&.id)
  end

  def create
    @entry = Entry.new(entry_params)
    if @entry.save
      redirect_to place_path(@entry.place_id)
    else
      @place = Place.find(@entry.place_id)
      render :new
    end
  end

  private

  def entry_params
    params.require(:entry).permit(:title, :description, :posted_on, :place_id)
  end
end
