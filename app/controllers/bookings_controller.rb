class BookingsController < ApplicationController
  before_action :authorize

  def index
    if params[:pnr_number].present?
      seat = Seat.find_by_pnr_number(params[:pnr_number])

      if seat.present?
        seat_configuration = seat.seat_configuration
        @seats = seat_configuration.seats.available_seats(seat_configuration.id) if seat.present?
      end

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

  def seat_upgrade
    if params[:pnr_number].present?
      @seat = Seat.find_by_pnr_number(params[:pnr_number])

      if @seat.blank?
        flash[:error] = "Please enter valid PNR Number"
        return
      end

      @seat_configuration = @seat.seat_configuration

      if @seat_configuration.is_economy_class?
        @first_class = available_seats(SeatCategory::FIRST_CLASS)
        @business_class = available_seats(SeatCategory::BUSINESS_CLASS)

      elsif @seat_configuration.is_business_class?
        @first_class = available_seats(SeatCategory::FIRST_CLASS)

      else
        flash[:error] = "Sorry, You are not able to upgrade your seat"
      end

    end

  end

  def seat_upgrade_confirmation
    params.require(:seat_id)
    params.require(:old_seat_id)

    @seat = Seat.find(params[:seat_id])
    @old_seat = Seat.find(params[:old_seat_id])

    if @seat.update_attributes(:booked => true)
      @old_seat.update_attributes(:booked => false)
      redirect_to(bookings_path,
                    notice: "Selected seat has been upgraded")
    end
  end


  private

  def payment_calculation
    @selected_seats = Seat.where("pnr_number" => params[:pnr_numbers])
    @seat_configuration = SeatConfiguration.find(@selected_seats.first.seat_configuration_id)

    @total_seats = @seat_configuration.seats
    @available_seats = @total_seats.available

    @total_amount = @selected_seats.count * @seat_configuration.base_amount

    if @total_seats.count/2 > @available_seats.count
      added_amount = @seat_configuration.base_amount * 0.1
      @base_amount = @seat_configuration.base_amount + added_amount
      @total_amount = @total_amount + (@selected_seats.count * added_amount)
    end
  end

  def available_seats(category)
    SeatConfiguration.where(:airplane_id => @seat_configuration.airplane_id, :seat_category_id => category).first.seats.available
  end

end
