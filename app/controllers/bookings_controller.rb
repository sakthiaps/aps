class BookingsController < ApplicationController
  before_action :authorize

  def index
    if params[:pnr_number].present?
      seat = Seat.find_by_pnr_number(params[:pnr_number])
      @seats = seat.seat_configuration.seats if seat.present?
    end

    if request.xhr?
      render(:json => {
        :html => render_to_string(:partial => 'bookings/seats'),
      })
      return
    end

  end

  # def new
  #   @airplane = Airplane.new
  # end

  def create
    # @airplane = Airplane.new(seat_configuration_params)

    # if @airplane.save
    #   redirect_to(airplane_path(@airplane),
    #               notice: "Airplane seat configuration has been created")
    # else
    #   render :new
    # end
  end

  # def edit
  #   @airplane = Airplane.find(params[:id])
  # end

  # def update
  #   @airplane = Airplane.find(params[:id])

  #   if @airplane.update_attributes(seat_configuration_params)
  #     redirect_to(airplane_path(@airplane),
  #                 notice: "Airplane seat configuration has been updated")
  #   else
  #     render :edit
  #   end
  # end

  def show

  end

end
