# show all items from the list
get '/list' do
  @list = current_user.items
  erb :'lists/index'
end

post '/list' do
  items = params[:item].keys
  session = Session.today(current_user)

  items.each do |i|
    checkoff = Checkoff.new(item_id: i, session_id: session.id)
    checkoff.save unless Checkoff.exists?(checkoff)
  end

  redirect "/users/#{current_user.id}"
end
