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
  user = User.find_by(username: params[:username]) #create new login

  if user && user.authenticate(params[:password])
    session[:id] = user.id
    redirect '/list' #redirect back to login index page
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
