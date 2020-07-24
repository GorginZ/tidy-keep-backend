User.create(
  email: "Admin@gmail.com", password: "password", first_name: "First", last_name: "Last", phone: "0455345555")

User.create(
  email: "g@gmail.com", password: "password", first_name: "Georgia", last_name: "Leng", phone: "0455343335")

 Address.create(user_id: 1, street_address: "120 Spencer Street", state: "Vic", post_code: 3003)


Service.create(
  title: 'bathroom',
  price: 40
)

Service.create(
  title: 'bedroom',
  price: 50
)

Service.create(
  title: 'standard',
  price: 130
)

Service.create(
  title: 'deluxe',
  price: 180
)

Service.create(
  title: 'deep clean',
  price: 230
)

Service.create(
  title: 'moving in/out',
  price: 300
)

Service.create(
  title: 'dishes',
  price: 25
)

Service.create(
  title: 'laundry',
  price: 25
)

Service.create(
  title: 'oven',
  price: 25
)

Service.create(
  title: 'cabinets',
  price: 25
)

Booking.create(
  date_of: '2020/07/25',
  recurring: true,
  address_id: 1,
  price: 100,
  user_id: 1,
  time_of: '10:30'

)
BookingService.create(
  service_id: 1,
  booking_id: 1,
  quantity: 2

)

