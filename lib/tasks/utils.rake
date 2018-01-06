namespace :utils do
  desc "fullfil database"
  task seed: :environment do
  	puts "Geration of contacts..."

	10.times do |i|

		Contact.create!(
			name: Faker::Name.name,
			email: Faker::Internet.email,
			kind: Kind.all.sample,
			rmk: LeroleroGenerator.sentence([1,2,3,4,5].sample)
		)
	end

	puts " Contacts were successfully created"
	puts "-----------------------------------"
	puts " Geration of addresses..."
	
	Contact.all.each do |contact|

		Address.create!(
			street: Faker::Address.street_address,
			city: Faker::Address.city,
			state: Faker::Address.state_abbr,
			contact: contact
			)
	end

	puts "Addresses were successfully generated"
	puts "-------------------------------------"
	puts "Generation of phones"

	Contact.all.each do |contact|
		Random.rand(1..5).times do |i|
			Phone.create!(
				phone: Faker::PhoneNumber.phone_number,
				contact: contact
				)
		end
	end

  end

end
