class BoatsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_boat, only: [:edit, :update, :destroy, :show]
    before_action :map_boat, only: [:tracker, :tracker_move]

    def index
      @boats = Boat.all
    end

    def tracker
    end

    def tracker_move
    end

    def new
      @boat = Boat.new
    end

    def create
      @boat = Boat.new(boat_params)
      if @boat.save
        redirect_to boats_path
      else
        render :new, status: :unprocessable_entity
      end
    end

    def edit
    end

    def update_location
      boat = boat.find(params[:id])
      latitude = location_params[:latitude]
      longitude = location_params[:longitude]
      boat.update(location_params)
      location_result = Geocoder.search([latitude, longitude]).first

      if location_result && location_result.city.present?
        render json: { message: location_result.city}
        boat.update(location: location_result.city)
        #redirect_to tracker_move_path
      else
        render json: { message: "Unable to determine city from coordinates."}
        boat.update(location: "Offshore")
      end
    end

    def update
      @boat.user = current_user
      if @boat.update(boat_params)
        redirect_to boat_path(@boat), notice: 'Upadated successfully!', status: :see_other
      else
        render :edit
      end
    end

    def my_boats
      @boats = boat.where(user: current_user)
      render :index
    end

    def destroy
      @boat.destroy
      redirect_to boats_path, notice: 'boat was successfully destroyed!', status: :see_other
    end

    def show
    end


    def your_crew
      @users = User.all
    end

    private

    def location_params
      params.require(:boat).permit(:latitude, :longitude)
    end

    def boat_params
      params.require(:boat).permit(:id,:name, :number_of_guests, :price, :location, :capacity, :image,:description)
    end

    def set_boat
      @boat = Boat.find(params[:id])
    end

    def map_boat
      @boats = boat.where(user: current_user)

      @markers = @boats.geocoded.map do |boat|
        {
          lat: boat.latitude,
          lng: boat.longitude,
          location: boat.location,
          id: boat.id,
          info_window_html: render_to_string(partial: "info_window", locals: {boat: boat}),
          marker_html: render_to_string(partial: "markers", locals: {boat: boat}),
          marker_html2: render_to_string(partial: "markers2", locals: {boat: boat})
        }
      end
    end
  end
