class FlightsController < ApplicationController
  before_action :authorize
  before_action :set_flight, :only => [:edit, :update, :show, :destroy]

  def index
   @flights_grid = initialize_grid(Flight,
                                  include: [:airplane],
                                  order: 'flights.id',
                                  order_direction: 'desc',
                                  name: 'g1'
    )
  end

  def new
    @flight = Flight.new
  end

  def create
    @flight = Flight.new(flight_params)

    if @flight.save
      redirect_to(flights_path,
                  notice: "Flight details has been created")
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @flight.update_attributes(flight_params)
      redirect_to(flights_path,
                  notice: "Flight details has been updated")
    else
      render :edit
    end
  end

  def show
  end

  def destroy
    if @flight.destroy
      redirect_to(flights_path,
                  notice: "Flight details has been deleted")
    end
  end

  private

  def flight_params
    params.require(:flight).permit(:airplane_id,
                                   :flight_number,
                                   :origin_id,
                                   :destination_id
                                     )
  end

  def set_flight
    @flight = Flight.find(params[:id])
    raise HttpError::NotFound unless @flight.present?
  end

end
