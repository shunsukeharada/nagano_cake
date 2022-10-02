# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(
    email: "aaa@gmail.com",
    password: "aaaaaa"
)

Genre.create!([{name: "ケーキ"}, {name: "プリン"}, {name: "焼き菓子"}, {name: "キャンディ"}])


Item.create!(
 [
  {
    name: "aaa",
    explanation: "aaaaa",
    tax_out_price: 500,
    image: File.open("./app/assets/images/no_image.jpg"),
    genre_id: 1,
    is_sale: "false"
  },
  {
    name: "bbb",
    explanation: "bbbbb",
    tax_out_price: 1000,
    image: File.open("./app/assets/images/no_image.jpg"),
    genre_id: 2,
    is_sale: "true"
  }
 ]    
)

