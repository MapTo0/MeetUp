get '/' do
  File.read('public/index.html')
end

post '/register' do
  user_data = JSON.parse request.body.read

  if User.count(:email => user_data['email']) == 0
    User.create(
      email: user_data['email'],
      first_name: user_data['firstName'],
      last_name: user_data['lastName'],
      password: BCrypt::Password.create(user_data['password'])
    )
    status 200
  else
    status 401
  end
end

post '/login'  do
  user_credentials = JSON.parse request.body.read
  user_email = user_credentials['email']
  user_password = user_credentials['password']
  first_user_found = User.first(:email => user_email)
  is_password_correct = first_user_found.password == user_password

  if first_user_found && is_password_correct
    status 200
  else
    status 403
  end
end