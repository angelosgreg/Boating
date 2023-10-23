class SkippersController < ApplicationController
  before_action :authenticate_user!
    before_action :set_skipper, only: [:edit, :update, :destroy, :show]
    before_action :map_skipper, only: [:tracker, :tracker_move]

    def index
      @skippers = Skipper.all
    end

    def tracker
    end

    def tracker_move
    end

    def new
      @skipper = Skipper.new
    end

    def create
      @skipper = Skipper.new(skipper_params)
      if @skipper.save
        redirect_to skippers_path
      else
        render :new, status: :unprocessable_entity
      end
    end

    def edit
    end

    def update_location
      skipper = skipper.find(params[:id])
      latitude = location_params[:latitude]
      longitude = location_params[:longitude]
      skipper.update(location_params)
      location_result = Geocoder.search([latitude, longitude]).first

      if location_result && location_result.city.present?
        render json: { message: location_result.city}
        skipper.update(location: location_result.city)
        #redirect_to tracker_move_path
      else
        render json: { message: "Unable to determine city from coordinates."}
        skipper.update(location: "Offshore")
      end
    end

    def update
      @skipper.user = current_user
      if @skipper.update(skipper_params)
        redirect_to skipper_path(@skipper), notice: 'Upadated successfully!', status: :see_other
      else
        render :edit
      end
    end

    def my_skippers
      @skippers = skipper.where(user: current_user)
      render :index
    end

    def destroy
      @skipper.destroy
      redirect_to skippers_path, notice: 'skipper was successfully destroyed!', status: :see_other
    end

    def show
    end


    def your_crew
      @users = User.all
    end

    private

    def location_params
      params.require(:skipper).permit(:latitude, :longitude)
    end

    def skipper_params
      params.require(:skipper).permit(:id,:firstname, :lastname, :money, :city, :photo,:info)
    end

    def set_skipper
      @skipper = Skipper.find(params[:id])
    end

    def map_skipper
      @skippers = skipper.where(user: current_user)

      @markers = @skippers.geocoded.map do |skipper|
        {
          lat: skipper.latitude,
          lng: skipper.longitude,
          location: skipper.location,
          id: skipper.id,
          info_window_html: render_to_string(partial: "info_window", locals: {skipper: skipper}),
          marker_html: render_to_string(partial: "markers", locals: {skipper: skipper}),
          marker_html2: render_to_string(partial: "markers2", locals: {skipper: skipper})
        }
      end
    end
end
