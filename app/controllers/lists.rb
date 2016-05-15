# show all items from the list
get '/list' do
  @list = current_user.items
  erb :'lists/index'
end
