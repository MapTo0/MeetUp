class User
  include DataMapper::Resource

  property :id, Serial
  property :email, String, :required => true
  property :first_name, String
  property :last_name, String
  property :password_hash, String
  property :password_salt, String
end