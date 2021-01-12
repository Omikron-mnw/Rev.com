class Public::HomesController < ApplicationController

  def top
    @comics = Comic.all
  end

  def about
  end

end
