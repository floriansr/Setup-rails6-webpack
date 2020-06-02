require "faker"

Image.destroy_all
User.destroy_all

picture_array = ["1.png","2.png","3.png","4.png","5.png","6.png"]


15.times do |x|
	x = User.create(email: Faker::Internet.free_email, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, username: Faker::Name.name, password: Faker::Blockchain::Bitcoin.testnet_address)
	# newFile = File.open(Rails.root.join('app/assets/images/' + picture_array.shuffle.sample))
	# x.images << Image.new(stream: Base64.strict_encode64(File.open(newFile).read), description: Faker::Creature::Dog.sound)
end