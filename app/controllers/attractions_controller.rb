class AttractionsController < ApplicationController
  before_action :set_attraction, only: [:show, :edit, :update, :destroy]

  # GET /attractions
  # GET /attractions.json
  def index
    @attractions = Attraction.all
    @hash = Gmaps4rails.build_markers(@attractions) do |attraction, marker|
      marker.lat attraction.latitude
      marker.lng attraction.longitude
      marker.infowindow "<div class='attDetails'>
        <h4>Name: #{attraction.name}</h4>
        <img src='http://www.e-perpustakaan.com/wp-content/uploads/2015/07/Jurong-Bird-Park-Address-Singapore.jpg' alt='birdpark' />
        <a href=/attractions/#{attraction.id}>View reviews</a>
      </div>"
    end
  end

  # GET /attractions/1
  # GET /attractions/1.json
  def show
    @attraction = Attraction.find(params[:id])
    @reviews = Review.where("attraction_id = ?", params[:id])
  end

  # GET /attractions/new
  def new
    @attraction = Attraction.new
  end

  # GET /attractions/1/edit
  def edit
  end

  # POST /attractions
  # POST /attractions.json
  def create
    @attraction = Attraction.new(attraction_params)

    respond_to do |format|
      if @attraction.save
        format.html { redirect_to @attraction, notice: 'Attraction was successfully created.' }
        format.json { render :show, status: :created, location: @attraction }
      else
        format.html { render :new }
        format.json { render json: @attraction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /attractions/1
  # PATCH/PUT /attractions/1.json
  def update
    respond_to do |format|
      if @attraction.update(attraction_params)
        format.html { redirect_to @attraction, notice: 'Attraction was successfully updated.' }
        format.json { render :show, status: :ok, location: @attraction }
      else
        format.html { render :edit }
        format.json { render json: @attraction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /attractions/1
  # DELETE /attractions/1.json
  def destroy
    @attraction.destroy
    respond_to do |format|
      format.html { redirect_to attractions_url, notice: 'Attraction was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attraction
      @attraction = Attraction.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def attraction_params
      params.require(:attraction).permit(:latitude, :longitude, :address, :description, :category, :name)
    end
end
