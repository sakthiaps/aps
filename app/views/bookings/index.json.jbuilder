json.array!(@seats) do |seat|
  json.id seat.id
  json.seat_configuration seat.seat_configuration_id
  json.pnr_number seat.pnr_number
  json.booked seat.booked
end