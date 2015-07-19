class User
  include DataMapper::Resource

  property :id, Serial
  property :email, String, :required => true, :unique => true, :format  => :email_address
  property :first_name, String
  property :last_name, String
  property :password, BCryptHash

  validates_length_of  :password, :min => 8
end