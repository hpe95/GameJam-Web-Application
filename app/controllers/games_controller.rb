class GamesController < ApplicationController
	include LudumDareGame
  def index
    @game = Game.find(1)
    @game.name = getTitle("http://ludumdare.com/compo/ludum-dare-35/?action=preview&uid=56711")
    @game.description = getDescription("http://ludumdare.com/compo/ludum-dare-35/?action=preview&uid=56711")
    @game.save!
  end

  def show
    @game = Game.find(1)
    @images = getImages("http://ludumdare.com/compo/ludum-dare-35/?action=preview&uid=56711")
  end

end
