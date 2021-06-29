# Seed user
User.create!(
  email: "vothevan96@gmail.com",
  password: "123456",
  first_name: "The Van",
  last_name: "Vo",
  phone: "123456789",
  actived: true,
  admin: true,
  address: "16 Lý Thường Kiệt, Hải Châu, Tp. Đà Nẵng"
)

14.times do |n|
  User.create!(
    email: "vothevan96@gmail.com",
    password: "123456",
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    phone: Faker::PhoneNumber.cell_phone_in_e164,
    actived: true,
    address: Faker::Address.full_address
  )
end
