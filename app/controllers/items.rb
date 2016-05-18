# View to new item to the list
get '/items/new' do
  if request.xhr?
    erb :"items/_new", layout: false
  else
    erb :'items/new'
  end
end

# process adding new item to the list
post '/items' do
  @item = Item.new(params[:item])
  if @item.save
    if request.xhr?
      erb :'items/_show', layout: false, locals: { item: @item }
    else
      redirect "/users/#{current_user.id}"
    end
  else
    @errors = @item.errors.full_messages
    if request.xhr?
      status 400
      erb :'_errors', layout: false, locals: { errors: @errors }
    else
      erb :'items/new'
    end
  end
end

# view to edit item
get '/items/:id/edit' do
  @item = Item.find_by(id: params[:id])
  erb :'items/edit'
end

# process updating item
put '/items/:id' do
  @item = Item.find_by(id: params[:id])
  if @item.update(params[:item])
    redirect "/users/#{current_user.id}"
  else
    @errors = @item.errors.full_messages
    erb :'items/edit'
  end
end

# delete an item
delete '/items/:id' do
  item = Item.find_by(id: params[:id])
  item.destroy
  redirect "/users/#{current_user.id}"
end
