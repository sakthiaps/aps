class BookingsController < ApplicationController
  before_action :authorize

  def index
    if params[:pnr_number].present?
      seat = Seat.find_by_pnr_number(params[:pnr_number])
      @seats = seat.seat_configuration.seats.available(seat) if seat.present?
    end

    if request.xhr?
      render(:json => {
        :html => render_to_string(:partial => 'bookings/seats'),
      })
      return
    end

  end

  def confirmation
    params.require(:pnr_numbers)
    payment_calculation
  end

  def book
    seats = Seat.where("id" => params[:seat_ids])

    if seats.present?
      seats.update_all(:booked => true)
      redirect_to(bookings_path,
                    notice: "Selected seats has been booked")
    end

  end

  # def show

  # end

  private

  def payment_calculation
    @selected_seats = Seat.where("pnr_number" => params[:pnr_numbers])
    @seat_configuration = SeatConfiguration.find(@selected_seats.first.seat_configuration_id)
    @total_seats = @seat_configuration.seats
    @available_seats = @total_seats.available(@selected_seats.first)
    @total_amount = @selected_seats.count * @seat_configuration.base_amount

    if @total_seats.count/2 > @available_seats.count
      added_amount = @seat_configuration.base_amount * 0.1
      @base_amount = @seat_configuration.base_amount + added_amount
      @total_amount = @total_amount + (@selected_seats.count * added_amount)
    end
  end

end
