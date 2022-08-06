class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'

  # returns an array of JSON objects for all bakeries
  get '/bakeries' do 
    bakeries = Bakery.all
    bakeries.to_json
  end
  
  # returns a single bakery as JSON with its baked good nested in an array
  get '/bakeries/:id' do 
    bakery = Bakery.find(params[:id])
    bakery.to_json(include: :baked_goods)
  end

  # returns an array of baked goods as JSON, sorted by price in DESC order
  get '/baked_goods/by_price' do 
    baked_goods_by_price = BakedGood.order(price: :desc)
    baked_goods_by_price.to_json
  end

  # returns the single most expensive baked good as JSON
  get '/baked_goods/most_expensive' do
    baked_goods_most_expensive = BakedGood.order(:price).last
    baked_goods_most_expensive.to_json
  end

end
