get '/' do
  redirect '/login'
end

get '/login' do
  erb :login
end

post '/login' do
  unless User.authenticate(params[:username], params[:password])
    session[:username] = params[:username]
    session[:logged_in?] = true
    redirect '/secret'
  else
    redirect '/login'
  end
end

get '/new_user' do

  erb :new_user
end

post '/new_user' do
  if params[:password] == params[:confirm_password] && User.where(username: params[:username]).empty?
    User.create(username: params[:username], password: params[:password]) 
    redirect '/login'
  else
    redirect '/new_user'
  end
end

get '/secret' do

  erb :secret
end

get '/logout' do
  redirect '/'
end
