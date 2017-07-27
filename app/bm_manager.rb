ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'data_mapper_setup'

class BookmarkManager < Sinatra::Base

  get '/links' do
    @links = Link.all
    erb :'links/index'
  end

  get '/links/new' do
    erb :'links/new'
  end

  post '/links' do
    link = Link.new(url: params[:url], # 1. Craete a link
                  title: params[:title])
    tag = Tag.first_or_create(name: params[:tags]) # 2. Create a tag for the link
    link.tags << tag  # 3. Adding the tag top the link's DataMapper collection
    link.save      # 4. Saving link
    redirect to('/links')
  end

  get '/tags/:name' do
    tag = Tag.first(name: params[:name])
    @links = tag ? tag.links : []
    erb :'links/index'
  end

end
