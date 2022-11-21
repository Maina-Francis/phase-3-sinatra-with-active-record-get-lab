class ApplicationController < Sinatra::Base

  set :default_content_type, 'application/json'

  # add routes

  get '/bakeries' do
    # gets the bakeries from the database
    bakeries = Bakery.all

    # sends the bakeries data back in json format
    bakeries.to_json
  end

  get '/bakeries/:id' do
    #gets the bakery with the given id from the database
    bakeries = Bakery.all.find(params[:id])

    #send back the bakery data in json-format
    bakeries.to_json(include: :baked_goods)
  end

  get '/baked_goods' do
    # gets all the baked_goods data from the database
    baked_goods = BakedGood.all
    # send back the data in json-format
    baked_goods.to_json
  end

  get '/baked_goods/by_price' do
    #gets back all the baked_goods data from the database sorted by price in descending order
    baked_goods = BakedGood.all.order(price: :desc)
    #send back the data in json-format
    baked_goods.to_json
  end

  get '/baked_goods/most_expensive' do
    # gets the most expensive baked good from the database
    most_expensive = BakedGood.all.order(price: :desc).limit(1)
    # send back the data in json-format
    most_expensive.to_json(only: [:name, :price])
  end
end
