require "bundler/setup"
require "pry"
Bundler.require :default
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }



get '/' do
  name = params['name']
  @store = Store.create({name: name})
  @brands = Brand.all
  @stores = Store.all
  @brands = Brand.all
  erb :index
end

get '/stores' do
  @stores = Store.all
  erb :stores
end

get '/brands' do
  @brands = Brand.all
  erb :brands
end

post '/stores/new' do
  name = params['name']
  @store = Store.create({name: name})
  @brands = Brand.all
  @stores = Store.all
  @brands = Brand.all
  redirect '/stores'
end

get '/stores/:id' do
  @store = Store.find(params["id"].to_i)
  @brands = Brand.all
  erb :store
end

post '/brands/new' do
  name = params["name"]
  brand = Brand.create({name: name})
  redirect '/brands'
end
