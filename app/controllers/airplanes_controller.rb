class AirplanesController < ApplicationController
  before_action :authorize
  before_action :set_airplane, :only => [:edit, :update, :show, :destroy]

  def index
   @plane_lists_grid = initialize_grid(Airplane,
                                  order: 'airplanes.id',
                                  order_direction: 'desc',
                                  name: 'g1'
    )
  end

  def new
    @airplane = Airplane.new
  end

  def create
    @airplane = Airplane.new(seat_configuration_params)

    if @airplane.save
      redirect_to(airplanes_path,
                  notice: "Airplane seat configuration has been created")
    else
      render :new
    end
  end

  def edit
  end

  def update
    @airplane = Airplane.find(params[:id])

    if @airplane.update_attributes(seat_configuration_params)
      redirect_to(airplane_path(@airplane),
                  notice: "Airplane seat configuration has been updated")
    else
      render :edit
    end
  end

  def show
  end

  def destroy
    if @airplane.destroy
      redirect_to(airplanes_path,
                  notice: "Airplane details has been deleted")
    end
  end

  private

  def seat_configuration_params
    params.require(:airplane).permit(:name,
                                     :airplane_type,
                                     seat_configurations_attributes:[
                                      :number_of_rows,
                                      :seats_in_row,
                                      :seat_category_id,
                                      :base_amount
                                     ])
  end

  def set_airplane
    @airplane = Airplane.find(params[:id])
    raise HttpError::NotFound unless @airplane.present?
  end

end
