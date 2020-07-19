User.create(
  email: "Admin@gmail.com", password: "password", first_name: "First", last_name: "Last", phone: 0455345555)

User.create(
  email: "g@gmail.com", password: "password", first_name: "Georgia", last_name: "Leng", phone: 0455343335)

 Address.create(user_id: 1, street_address: "120 Spencer Street", state: "Vic", post_code: 3003)


Service.create(
  title: 'bathroom',
  price: 50
)

Service.create(
  title: 'bedroom',
  price: 130
)

Service.create(
  title: 'standard',
  price: 100
)

Service.create(
  title: 'deluxe',
  price: 200
)

Service.create(
  title: 'deep clean',
  price: 300
)

Service.create(
  title: 'moving in/out',
  price: 400
)

Booking.create(
  user_id: 1,
  date_of: '25/02/15',
  recurring: true,
  address_id: 1

)