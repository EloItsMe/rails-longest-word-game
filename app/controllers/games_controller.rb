require 'json'
require 'open-uri'

class GamesController < ApplicationController
  def new
    @letters = ('A'..'Z').to_a.sample(10)
  end

  def score
    url = "https://wagon-dictionary.herokuapp.com/#{params[:response]}"
    @valide = true
    @api_response = api(url)
    response = params[:response].downcase
    letters = params[:letters].downcase

    response.chars.each do |letter|
      @valide = false unless letters.include?(letter)
      letters.slice!(letter)
    end
  end

  private

  def api(url)
    JSON.parse(URI.open(url).read)
  end
end
