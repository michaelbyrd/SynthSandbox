class SoundsController < ApplicationController
  before_action :set_sound, except: [:create, :new]

  def index
    @sounds = Sound.all
  end

  def show
    @sound = Sound.find(params[:id])
  end

  def new
    @sound = Sound.new
  end

  def create
    @sound = Sound.new(sound_params)
    respond_to do |format|
      if @sound.save
        format.html { redirect_to @sound, notice: 'Sound was successfully created.' }
        format.js do
          @sounds = Sound.all
          redirect_to @sound
        end
      else
        format.js { render :new }
      end
    end
  end

  def update
    @sound.save
    respond_to do |format|
      format.js
    end
  end

  private

  def set_sound
    @sound = Sound.find(params[:id])
  end

  def sound_params
    params.require(:sound).permit(:code, :description)
  end

end
