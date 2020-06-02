require "faker"

User.destroy_all


15.times do |x|
	x = User.create(email: Faker::Internet.free_email, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, username: Faker::Name.name, password: Faker::Blockchain::Bitcoin.testnet_address)
end

# x.picture.attach(io: File.open(Rails.root.join('app/assets/images/prv/work/' + picture_array.shuffle.sample)), filename: 'cover_brand')
