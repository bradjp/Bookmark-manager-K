require 'sinatra/base'
require_relative './lib/bookmarks'
require './database_connection_setup'

class BookmarkManager < Sinatra::Base
  enable :method_override

  get '/' do
    "Bookmark Manager"
    # erb :index
  end

  get '/bookmarks' do
    @bookmarks = Bookmarks.all
    erb(:bookmarks)
  end

  get '/bookmarks/new' do

    erb(:"bookmarks/new")
  end

  post '/bookmarks' do
    Bookmarks.create(url: params[:url], title: params[:title])
    redirect '/bookmarks'
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


  run! if app_file == $0
end
