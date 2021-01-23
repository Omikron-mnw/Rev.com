class Public::HomesController < ApplicationController

  def top
    @comics = Comic.all
    # @random = Comic.order("RANDOM()").limit(12)
  end

  def about
  end

end
