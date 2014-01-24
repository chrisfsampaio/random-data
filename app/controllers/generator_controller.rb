require 'json'

class GeneratorController < ApplicationController
  def generate

  	count = params[:count].to_i

  	json = {:result => []}

  	count.times do |i|
  		json[:result].push({
  			:name => Faker::Name.name ,
  			:email => Faker::Internet.email,
  			:address => Faker::Address.street_address + ', ' + Faker::Address.city + ', ' + Faker::Address.state + ', '+Faker::Address.zip,
  			:code => Faker::Code.isbn,
  			:company => Faker::Company.name + ' - ' + Faker::Company.catch_phrase,
  			:phone => Faker::PhoneNumber.phone_number
  		})

  		# json += '{
  		# 	"name" : "' + Faker::Name.name + '",
  		# 	"email" : "' + Faker::Internet.email + '",
  		# 	"address" : "' + Faker::Address.street_address + ', ' + Faker::Address.city + ', ' + Faker::Address.state + ', '+Faker::Address.zip+ '",
  		# 	"code" : "' + Faker::Code.isbn + '",
  		# 	"company" : "' + Faker::Company.name + ' - ' + Faker::Company.catch_phrase+ '",
  		# 	"phone"
  		# }'
  		# json += (i + 1 == count ? '' : ',')
  	end
  	
  	# json += ']}'
	render :json => json

  	# json_string = params[:plain].upcase == 'TRUE' ? json.to_json : JSON.pretty_generate(json)

  	# render text: json_string

  end
end
