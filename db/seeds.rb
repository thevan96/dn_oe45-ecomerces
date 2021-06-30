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
    email: "account#{n}@gmail.com",
    password: "123456",
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    phone: Faker::PhoneNumber.cell_phone_in_e164,
    actived: true,
    address: Faker::Address.full_address
  )
end

phone = Category.create!(name: "phone")
laptop = Category.create!(name: "laptop")
accessories = Category.create!(name: "accessories")
Category.create!([
  {
    name: "Samsung",
    parent_id: phone.id
  },
  {
    name: "Xiaomi",
    parent_id: phone.id
  },
  {
    name: "Apple",
    parent_id: phone.id
  },
  {
    name: "Oppo",
    parent_id: phone.id
  }
])

Category.create!([
  {
    name: "Apple",
    parent_id: laptop.id
  },
  {
    name: "Asus",
    parent_id: laptop.id
  },
  {
    name: "Dell",
    parent_id: laptop.id
  },
  {
    name: "HP",
    parent_id: laptop.id
  },
])

Category.create!([
  {
    name: "usb",
    parent_id: accessories.id
  },
  {
    name: "keyboard",
    parent_id: accessories.id
  },
  {
    name: "disk",
    parent_id: accessories.id
  },
  {
    name: "headphones",
    parent_id: accessories.id
  }
])

category_samsung = Category.find_by name: "Samsung"
Product.create!([
  {
    name: "Galaxy Note series",
    price: 23_990_000,
    description: Faker::Lorem.paragraph,
    category_id: category_samsung.id
  },
  {
    name: "Galaxy Z series",
    price: 19_990_000,
    description: Faker::Lorem.paragraph,
    category_id: category_samsung.id
  },
  {
    name: "Samsung Galaxy Z Fold2 5G",
    price: 50_000_000,
    description: Faker::Lorem.paragraph,
    category_id: category_samsung.id
  }
])

category_xiaomi = Category.find_by name: "Xiaomi"
Product.create!([
  {
    name: "Xiaomi Redmi Note 10S",
    price: 6_209_000,
    description: Faker::Lorem.paragraph,
    category_id: category_xiaomi.id
  },
  {
    name: "Xiaomi Redmi 9A",
    price: 3_000_000,
    description: Faker::Lorem.paragraph,
    category_id: category_xiaomi.id
  },
])

category_dell = Category.find_by name: "Dell"
Product.create!([
  {
    name: "Dell G3",
    price: 26_990_000,
    description: Faker::Lorem.paragraph,
    category_id: category_dell.id
  },
  {
    name: "Laptop Dell Inspiron N7490",
    price: 20_990_000,
    description: Faker::Lorem.paragraph,
    category_id: category_dell.id
  }
])

12.times do |n|
  Product.create!(
    name: "Dell #{n}",
    price: Faker::Number.between(from: 15_000_000, to: 30_000_000),
    description: Faker::Lorem.paragraph,
    category_id: category_dell.id
  )
end

