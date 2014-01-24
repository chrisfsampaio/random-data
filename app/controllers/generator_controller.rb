require 'json'

class GeneratorController < ApplicationController
include ActionController::Live

  def generate

    response.headers['Content-Type'] = 'text/event-stream;application/json'

    count = params[:count].to_i

    response.stream.write '{ "result": ['

    count.times do |i|
      jsonPart = {
        :name => Faker::Name.name ,
        :email => Faker::Internet.email,
        :address => Faker::Address.street_address + ', ' + Faker::Address.city + ', ' + Faker::Address.state + ', '+Faker::Address.zip,
        :code => Faker::Code.isbn,
        :company => Faker::Company.name + ' - ' + Faker::Company.catch_phrase,
        :phone => Faker::PhoneNumber.phone_number
      }.to_json
      jsonPart += (i + 1 == count ? ']}' : ',')
      response.stream.write jsonPart
      
    end
    response.stream.close
    # self.response_body = Stream.new(params[:count].to_i)


  	# jsonHash = {:result => []}

  	# count.times do |i|
  	# 	jsonHash[:result].push({
  	# 		:name => Faker::Name.name ,
  	# 		:email => Faker::Internet.email,
  	# 		:address => Faker::Address.street_address + ', ' + Faker::Address.city + ', ' + Faker::Address.state + ', '+Faker::Address.zip,
  	# 		:code => Faker::Code.isbn,
  	# 		:company => Faker::Company.name + ' - ' + Faker::Company.catch_phrase,
  	# 		:phone => Faker::PhoneNumber.phone_number
  	# 	})
  	# end
  	
  	# render :json => {:name => "David"}.to_json, :callback => 'show'

  end

end


