class EntriesController < ApplicationController

  def new
    # We find the place first so the "New Entry" page can show 
    # which city we are adding a note for.
    @place = Place.find_by({ "id" => params["place_id"] })
  end

  def create
    # 1. Create a new blank Entry object
    @entry = Entry.new

    # 2. Fill the columns with data from the form (params)
    @entry["title"] = params["title"]
    @entry["description"] = params["description"]
    @entry["occurred_on"] = params["occurred_on"]
    @entry["place_id"] = params["place_id"]

    # 3. Save the row to the database
    @entry.save

    # 4. Redirect back to the specific place's show page
    redirect_to "/places/#{@entry["place_id"]}"
  end

end