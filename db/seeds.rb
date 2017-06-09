
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')

# country=Country.create!(Country_name: 'India',Country_code:'IN' )
# state=State.create!(state_name: 'U.P',country_id:country.id )
# city=City.create!(city_name: 'khatima',state_id:state.id )
# user_role=UserRole.create!(Role_name:'admin')
# place=Place.create!(Place_name:'new delhi'company_id: company.id)
# noge=Node.create!(node_name:'delhi',place_id: place.id)
# region=Region.create!(region_name:'East')
# user_region=UserRegion.create!(user_id:user.id,region_id:user_region.id)
# user=User.create!(First_Name: 'vijay',Last_name:'maurya',Email:'vmaurya1989@gmail.com',Company_id:company.id,Role_id:role.id,Monthly_Charge:"20000",Notes:'adadad',Active:'true'     )
# company=Company.create!(name: 'bittern',country_id:country.id '',state_id: state.id,city_id: city.id,postcode:'473751',active:'true')

