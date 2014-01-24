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
  	end
  	
	render :json => json

  end
  
end
