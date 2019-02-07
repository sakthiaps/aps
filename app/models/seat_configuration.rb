# -*- coding: utf-8 -*-
# +------------------+-----------------------+------+-----+---------+----------------+
# | Field            | Type                  | Null | Key | Default | Extra          |
# +------------------+-----------------------+------+-----+---------+----------------+
# | id               | bigint(20)            | NO   | PRI | NULL    | auto_increment |
# | airplane_id      | bigint(20)            | NO   | MUL | NULL    |                |
# | seat_category_id | bigint(20)            | NO   | MUL | NULL    |                |
# | number_of_rows   | int(11)               | YES  |     | NULL    |                |
# | seats_in_row     | int(11)               | YES  |     | NULL    |                |
# | base_amount      | decimal(9,2) unsigned | YES  |     | NULL    |                |
# +------------------+-----------------------+------+-----+---------+----------------+

class SeatConfiguration < ApplicationRecord
  belongs_to :airplane, :inverse_of => :seat_configurations
  belongs_to :seat_category, :inverse_of => :seat_configurations
  has_many :seats, :inverse_of => :seat_configuration,
           :dependent => :destroy

  accepts_nested_attributes_for :seats, allow_destroy: true

  after_create :create_seat

  validates :number_of_rows, :seats_in_row, :base_amount,  :presence => true


  def is_first_class?
    self.seat_category_id == SeatCategory::FIRST_CLASS
  end

  def is_business_class?
    self.seat_category_id == SeatCategory::BUSINESS_CLASS
  end

  def is_economy_class?
    self.seat_category_id == SeatCategory::ECONOMY_CLASS
  end

  private

  def create_seat
    total_seats = self.number_of_rows * self.seats_in_row
    return if total_seats == 0

    1.upto(total_seats) do |index|
      seat = Seat.new
      seat.pnr_number = generate_code
      seat.seat_configuration_id = self.id
      seat.save
    end
  end

  def generate_code
    SecureRandom.alphanumeric(8)
    # charset = Array('A'..'Z') + Array('a'..'z') + Array(1..9)
    # Array.new(number) { charset.sample }.join
  end

end
