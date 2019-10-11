require 'sinatra/base'
require_relative './lib/bookmarks'
require_relative './database_connection_setup'
require_relative './lib/comment'
require 'sinatra/flash'
require 'uri'

class BookmarkManager < Sinatra::Base
  enable :method_override, :sessions
  register Sinatra::Flash

  get '/bookmarks/:id/comments/new' do
    @bookmark_id = params[:id]
    erb :'comments/new'
  end

  post '/bookmarks/:id/comments' do
    Comment.create(bookmark_id: params[:id], text: params[:comment])
    redirect '/bookmarks'
  end
  

  get '/bookmarks' do
    @bookmarks = Bookmarks.all
    erb(:'bookmarks')
  end

  get '/bookmarks/new' do
    @bookmark_id = params[:id]
    erb(:'bookmarks/new')
  end

  delete '/bookmarks/:id' do
    Bookmarks.delete(id: params[:id])
    redirect '/bookmarks'
  end

  get '/bookmarks/:id/edit' do
    @bookmark_id = params[:id]
    erb :'bookmarks/edit'
  end

  patch '/bookmarks/:id' do
    Bookmarks.update(id: params[:id], title: params[:title], url: params[:url])
    redirect '/bookmarks'
  end

  post '/bookmarks' do
    flash[:notice] = "Not a valid URL!" unless Bookmarks.create(url: params[:url], title: params[:title])
    redirect '/bookmarks'
  end

  get '/users/new' do
    erb(:'users/new')
  end

  post '/users/' do
    redirect '/bookmarks'
  end

  run! if app_file == $0
end
