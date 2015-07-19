require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'data_mapper'
require 'json'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "sqlite3://#{Dir.pwd}/development.db")
DataMapper.auto_migrate!

require './models/init'
require './routes/init'


DataMapper.finalize