get '/' do
  # Look in app/views/index.erb
  erb :index
end

get '/new_user' do

  erb :new_user
end

post '/new_user' do

  erb :index
end

get '/secret' do
  
  erb :secret
end
