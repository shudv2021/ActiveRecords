#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, {adapter: "sqlite3", database: "barbershop.db"}

before do
@barbers = Barber.all
end

class Client < ActiveRecord::Base
end

class Barber < ActiveRecord::Base
end

get '/' do
	@barbers = Barber.all
	erb :index
end

get '/visit' do
	erb :visit
end

post '/visit' do
	
	@name = params['username']
	@phone = params['phone']
	@time = params['time']
	@barber = params['barber']
	@color = params['colorpicker']
	erb :visit
end