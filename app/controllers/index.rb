get '/' do
  # Look in app/views/index.erb
  #if seesion[:username] view -> load message
  erb :index
end

post '/' do
  unless User.authenticate(params[:username], params[:password])
    redirect '/secret'
  else
    redirect '/'
  end
end

get '/new_user' do

  erb :new_user
end

post '/new_user' do
  if params[:password] == params[:confirm_password]
    User.create(username: params[:username], password: params[:password]) 
    redirect '/'
  else
    redirect '/new_user'
  end
end

get '/secret' do
  "I can't believe you're seeing this right now..."
  # erb :secret
end
