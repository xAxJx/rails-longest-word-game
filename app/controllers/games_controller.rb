class GamesController < ApplicationController
  def new
    @letters = "lettertest"
    alphabet = ['a', 'b', 'c', 'd', 'e', 'f' ,'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r','s', 't', 'u', 'v', 'w', 'x', 'y', 'z']

    letterArray = []
    while letterArray.size < 10
      newletter = alphabet.sample
      letterArray.push(newletter)
    end

    @letters = letterArray.join(" ").upcase

  end

  def score
    @answer = params[:answer]
    @oletters = params[:original_letters]

    @result = ""
    matching = 0
    @test = []
    @checkletters = @oletters.split

    @answer.each_char do |letter|
      if (@checkletters.include?(letter.upcase))
        @test.push(letter)
        @checkletters.delete_at(@checkletters.index(letter.upcase))
      end
    end

    if @test.size == @answer.size
      @result = "GG you win"
    elsif @test.size != @answer.size
      @result = "You cannot build #{@answer} out of these letters."
    else
      @result = "Too bad you lose"
    end

  end
end
