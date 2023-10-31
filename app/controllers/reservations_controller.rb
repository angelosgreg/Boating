class ReservationsController < ApplicationController
  before_action :set_boat, only: [:new, :create]

  def index
    @reservations = Reservation.all
  end

  def new
    @reservation = Reservation.new

  end

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.user = current_user
    @reservation.skipper = @skipper
    if @reservation.save!
      redirect_to reservations_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    # authorize @Reservation
    @reservation = Reservation.find(params[:id])

  end


  def update
    # authorize @boat
    @reservation = Reservation.find(params[:id])
    if @reservation.update(reservation_params)
      redirect_to reservations_path, notice: 'Upadated successfully!', status: :see_other
    else
      render :edit
    end
  end

  def destroy
    # authorize @Reservation
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    redirect_to reservations_path, notice: 'Reservation was successfully destroyed!', status: :see_other
  end
  private

  def reservation_params
    params.require(:reservation).permit(:id,:start_date, :end_date)
  end

  def set_boat
    @skipper = Skipper.find(params[:skipper_id])
  end
end
