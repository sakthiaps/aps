class SeatConfiguration < ApplicationRecord
  belongs_to :airplane, :inverse_of => :seat_configurations
  belongs_to :seat_category, :inverse_of => :seat_configurations
  has_many :seats, :inverse_of => :seat_configuration,
           :dependent => :delete_all

  after_create :create_seat
  # has_many :seat_categories, :inverse_of => :seat_configurations

  private

  def create_seat
    total_seats = self.number_of_rows * self.seats_in_row
    return if total_seats == 0

    1.upto(total_seats) do |index|
      seat = Seat.new
      seat.pnr_number = generate_code(8)
      seat.seat_configuration_id = self.id
      seat.save
    end
  end
  #SecureRandom.alphanumeric
  def generate_code(number)
    charset = Array('A'..'Z') + Array('a'..'z') + Array(1..9)
    Array.new(number) { charset.sample }.join
  end

end
