# get all users
get '/users' do
  @users = User.all #define instance variable for view
  erb :'users/index.html' #show all users view (index)
end

# get form for creating a new user
get '/users/new' do
  erb :'users/new' #show new users view
end

# create a new user from form
post '/users' do
  #below works with properly formatted params in HTML form
  @user = User.new(params[:user]) #create new user
  if @user.save #saves new user or returns false if unsuccessful
    redirect '/users' #redirect back to users index page
  else
    erb :'users/new' # show new users view again(potentially displaying errors)
  end
end

# show a specific user
get '/users/:id' do
  #gets params from url
  @user = User.find(params[:id]) #define instance variable for view
  erb :'users/show' #show single user view
end

# get form for editing a user's attributes
get '/users/:id/edit' do
  #get params from url
  @user = User.find(params[:id]) #define intstance variable for view
  erb :'users/edit' #show edit user view
end

# update a specific user
put '/users/:id' do
  #get params from url
  @user = User.find(params[:id]) #define variable to edit
  @user.assign_attributes(params[:user]) #assign new attributes
  if @user.save #saves new user or returns false if unsuccessful
    redirect '/users' #redirect back to users index page
  else
    erb :'users/edit' #show edit user view again(potentially displaying errors)
  end
end

# delete a specific user
delete '/users/:id' do
  #get params from url
  @user = User.find(params[:id]) #define user to delete
  @user.destroy #delete user
  redirect '/users' #redirect back to users index page
end
