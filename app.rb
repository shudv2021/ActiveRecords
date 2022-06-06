#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, {adapter: "sqlite3", database: "barbershop.db"}

before do
@clients = Client.all
@barbers = Barber.all
end

class Client < ActiveRecord::Base
	validates :name, presence: true
	validates :phone, :presence => true
	validates :datestamp, presence: true
	validates :color, presence: true
	
end

class Barber < ActiveRecord::Base
end

get '/' do
	@barbers = Barber.all
	erb :index
end

get '/clients' do 
	erb :clients
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
	client = Client.new(:name => @name, :phone => @phone, :datestamp => @time,
											:barber => @barber, :color => @color)
	client.save ? "<h2>Вы записались</h2> " : "<h2>Ошибка, вы пропустили одно из полей</h2>"
			
end