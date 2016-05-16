# redirects from index to list page
get '/' do
  erb :'index'
end

# sends new login page
get '/login' do
  erb :'login/new'
end

# uses form data to sign user in
post '/login' do
  user = User.find_by(username: params[:username])

  if user && user.authenticate(params[:password])
    session[:id] = user.id
    if user.items.empty?
      redirect "/users/#{user.id}"
    else
      redirect '/list'
    end
  elsif user
    @errors = ["Incorrect password"]
    erb :'login/new'
  else
    @errors = ["Username not found"]
    erb :'login/new'
  end
end

get '/logout' do
  session.clear
  redirect "/"
end
