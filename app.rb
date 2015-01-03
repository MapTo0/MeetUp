require 'sinatra'
require 'bcrypt'
require 'data_mapper'

enable :sessions

DataMapper.setup(:default, ENV['DATABASE_URL'] || "sqlite3://#{Dir.pwd}/development.db")

class User
  include DataMapper::Resource

  property :id, Serial
  property :email, String, :required => true
  property :first_name, String
  property :last_name, String
  property :password_hash, String
  property :password_salt, String
end

DataMapper.finalize

class MeetUp < Sinatra::Base

  get "/" do
    erb :index
  end

  post "/signup" do
    password_salt = BCrypt::Engine.generate_salt
    password_hash = BCrypt::Engine.hash_secret(params[:password], password_salt)



    User.create(email: params[:email], first_name: params[:first_name], last_name: params[:last_name], password_hash: password_hash, password_salt: password_salt)

    @users = User.all

    redirect to '/home'

  end

  get '/home' do
    @users.class
  end

end