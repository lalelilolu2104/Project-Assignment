require 'exifr/jpeg'

class PlacesController < ApplicationController
  before_action :set_place, only: [:show, :edit, :update, :destroy]

  # GET /places
  # GET /places.json
  def index
    @places = Place.all
    @placeAry = []
    @places.each do |f|
      if(!f.images.empty?)
        f.images.each do |j|
          if(EXIFR::JPEG.new("public" + j.url).date_time != nil && EXIFR::JPEG.new("public" + j.url).gps != nil)
            @tempAry = [j.url, EXIFR::JPEG.new("public" + j.url).gps.latitude, EXIFR::JPEG.new("public" + j.url).gps.longitude, EXIFR::JPEG.new("public" + j.url).date_time.to_formatted_s(:long), Exiftool.new("public" + j.url).to_hash[:gimbal_yaw_degree], Exiftool.new("public" + j.url).to_hash[:gimbal_pitch_degree], Exiftool.new("public" + j.url).to_hash[:gimbal_roll_degree], Exiftool.new("public" + j.url).to_hash[:absolute_altitude], f.find_fov(EXIFR::JPEG.new("public" + j.url).model), f.find_sensor_height(EXIFR::JPEG.new("public" + j.url).model), f.find_sensor_width(EXIFR::JPEG.new("public" + j.url).model), Exiftool.new("public" + j.url).to_hash[:focal_length], f.get_direction(Exiftool.new("public" + j.url).to_hash[:gimbal_yaw_degree])]
            @placeAry.push(@tempAry)
          end
        end
      end
    end
  end

  # GET /places/1
  # GET /places/1.json
  def show
  end

  # GET /places/new
  def new
    @place = Place.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @place }
    end
  end

  # GET /places/1/edit
  def edit
  end

  # POST /places
  # POST /places.json
  def create
    @place = Place.new(place_params)
    
    respond_to do |format|
      if @place.save
        format.html
        format.json { render json: @place, status: :created, location: @place }
      else
        format.html
        format.json { render json: @place.errors, status: :unprocessable_entity }
      end
    end
    redirect_to places_path
  end

  # PATCH/PUT /places/1
  # PATCH/PUT /places/1.json
  def update
    respond_to do |format|
      if @place.update(place_params)
        format.html { redirect_to @place, notice: 'Place was successfully updated.' }
        format.json { render :show, status: :ok, location: @place }
      else
        format.html { render :edit }
        format.json { render json: @place.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /places/1
  # DELETE /places/1.json
  def destroy
    @place.destroy
    respond_to do |format|
      format.html { redirect_to places_url, notice: 'Place was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_place
      @place = Place.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def place_params
      params.require(:place).permit(:name, :latitude, :longitude, images: [])
    end
end
