class ApplicationController < Sinatra::Base

  set :default_content_type, 'application/json'

  get '/games' do
    # { message: "Hello world" }.to_json
    games = Game.all
    games.to_json
  end

   # use the :id syntax to create a dynamic route
  # get '/games/:id' do
    # look up the game in the database using its ID
    # send a JSON-formatted response of the game data
  # end

   get '/games/:id' do
    # look up the game in the database using its ID
    game = Game.find(params[:id])
    # send a JSON-formatted response of the game data
     game.to_json(only: [:id, :title, :genre, :price], include: {
      reviews: { only: [:comment, :score], include: {
        user: { only: [:name] }
      } }
    })
  end


end
