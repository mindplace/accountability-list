# get signup request
get '/users/new' do
  erb :'users/new'
end

# process signup request
post '/users' do
  @user = User.new(params[:user])
  if @user.save
    session[:id] = @user.id
    redirect "/list"
  else
    @errors = @user.errors.full_messages
    erb :'users/new'
  end
end

# request to view profile page
get '/users/:id' do
  @user = User.find_by(id: params[:id])
  if current_user == @user
    erb :'users/show' #show single user view
  else
    redirect '/'
  end
end

# request to edit profile
get '/users/:id/edit' do
  @user = User.find_by(id: params[:id])
  erb :'users/edit'
end

# result of form to edit profile
put '/users/:id' do
  @user = User.find_by(id: params[:id])

  if @user.update(params[:user])
    redirect "/users/#{@user.id}" #redirect back to users index page
  else
    @errors = @user.errors.full_messages
    erb :'users/edit'
  end
end

# delete user profile
delete '/users/:id' do
  user = User.find_by(id: params[:id])
  user.destroy
  redirect '/'
end
