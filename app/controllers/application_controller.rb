require './config/environment'
require './app/models/sample_model'

class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    return erb :index
  end
  
  post '/' do
    @autobots_response = params[:autobots_response]
    @newgirl_response = params[:newgirl_response]
    @lincoln_response = params[:lincoln_response]

    trivia_quiz = Trivia.new 
    @message = trivia_quiz.play_quiz(@autobots_response, @newgirl_response, @lincoln_response)
    return erb :results
  end
end
