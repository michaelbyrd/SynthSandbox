class SoundsController < ApplicationController
  def index
    @sounds = Sound.all
  end

  def show
    @sound = Sound.find(params[:id])
  end
end
