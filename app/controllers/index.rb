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

  erb :index
end

get '/secret' do
  
  # erb :secret
end
