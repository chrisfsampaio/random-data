require 'json'

class Stream
  def initialize count
    @iterationsCount = count
    @jsonHash = {:result => []}
  end

  def each
    @iterationsCount.times do |i|
      person = {
        :name => Faker::Name.name ,
        :email => Faker::Internet.email,
        :address => Faker::Address.street_address + ', ' + Faker::Address.city + ', ' + Faker::Address.state + ', '+Faker::Address.zip,
        :code => Faker::Code.isbn,
        :company => Faker::Company.name + ' - ' + Faker::Company.catch_phrase,
        :phone => Faker::PhoneNumber.phone_number
      }
      yield person.to_json
    end
  end
end

class GeneratorController < ApplicationController


  def generate

    self.response_body = Stream.new(params[:count].to_i)

  	# count = params[:count].to_i

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


