require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'lib/bookmark'

class BookmarkManager < Sinatra::Base

  enable :sessions, :method_override

  configure :development do
    register Sinatra::Reloader
  end

  get '/bookmarks/create' do
    erb :'bookmarks/create'
  end

  post '/bookmarks' do
    Bookmark.create(url: params[:bookmark], title: params[:title])
    redirect '/bookmarks'
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :'bookmarks/index'
  end

  delete '/bookmarks/:id' do
    Bookmark.delete(id: params[:id])
    redirect '/bookmarks'
  end

  patch '/bookmarks/:id' do
    # Bookmark.update(id: params[:id], url: params[:url], title: params[:title])
  end

  get '/bookmarks/update/:id' do
    p params
    # @current_bookmark = Bookmark.find(id: params[:id])
    erb :'bookmarks/update'
  end

  run! if app_file == $PROGRAM_NAME
end
