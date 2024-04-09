require "sinatra"
require "sinatra/reloader"

require 'sinatra'

get '/' do
  erb :index
end


get '/rock' do
  play_game('rock')
end

get '/paper' do
  play_game('paper')
end

get '/scissors' do
  play_game('scissors')
end

def play_game(user_move)
  computer_move = ['rock', 'paper', 'scissors'].sample
  result = determine_result(user_move, computer_move)
  case result
  when "tie"
    outcome = "We tied!"
  when "win"
    outcome = "We won!"
  when "lose"
    outcome = "We lost!"
  end

  @message = "We played #{user_move}. They played #{computer_move}. #{outcome}"
  erb :index
end


def determine_result(user_move, computer_move)
  if user_move == computer_move
    "tie"
  elsif (user_move == 'rock' && computer_move == 'scissors') ||
        (user_move == 'paper' && computer_move == 'rock') ||
        (user_move == 'scissors' && computer_move == 'paper')
    "win"
  else
    "lose"
  end
end
