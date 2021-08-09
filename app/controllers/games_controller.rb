require 'json'
require 'open-uri'
class GamesController < ApplicationController
    def initialize()
        @letters = []
        @submit_word = ""
    end
    
    def home
        
    end
    def new
        
        10.times do 
            @letters << ("a".."z").to_a.sample
         end
    end
    def score
        @submit_word = params[:word]
        @letters = params[:letters]

        @bool_valid = parseWord(@submit_word) ? true : false
    end
    
    def parseWord(word)
        url = "https://wagon-dictionary.herokuapp.com/#{word}"
        user_serialized = URI.open(url).read
        final_word_parsed = JSON.parse(user_serialized)["found"]
    end
    
    
end
