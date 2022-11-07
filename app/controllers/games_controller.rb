require 'uri'
require 'net/http'

class GamesController < ApplicationController
  def new
    @letters = ('A'..'Z').to_a.sample(10)
  end

  def score
    @word = params[:word]
    score = 0

    url = "https://wagon-dictionary.herokuapp.com/#{@word}"
    word_serialized = URI.open(url).read
    word = JSON.parse(word_serialized)
    if word['found']
      score += end_time - start_time
      message = 'win'
    else
      message = 'lose'
    end

    @hash_result = {
      score: score,
      message: message,
      time: end_time - start_time
    }
  end
end
