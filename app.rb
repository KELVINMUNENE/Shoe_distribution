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