require 'sinatra'
require 'bcrypt'
require 'data_mapper'

enable :sessions


get "/" do
  erb :index
end

post "/signup" do

  password_salt = BCrypt::Engine.generate_salt
  password_hash = BCrypt::Engine.hash_secret(params[:pass], password_salt)

  password_hash
end