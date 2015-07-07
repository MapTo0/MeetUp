require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'data_mapper'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "sqlite3://#{Dir.pwd}/development.db")

get '/' do
  erb :index
end

require './models/init'

DataMapper.finalize