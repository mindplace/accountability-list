# show all items from the list
get '/list' do
  @list = current_user.items
  if @list
    erb :'list/index'
  else
    redirect '/list/new'
  end
end
