class GamesController < ApplicationController
  def new
    @letters = "lettertest"
  end

  def score
    @answer = params[:answer]
    @oletters = params[:original_letters]

    @result = ""

    if @answer == @oletters
      @result = "GG you win"
    else
      @result = "Too bad you lose"
    end

  end
end
