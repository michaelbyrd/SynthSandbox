class SoundsController < ApplicationController
  before_action :set_sound, except: [:index, :create, :new]

  def index
    @sounds = Sound.all
  end

  def show
    @sound = Sound.find(params[:id])
  end

  def edit
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
    respond_to do |format|
      if @sound.update(sound_params)
        format.html { redirect_to @sound }
        format.json { render :show, status: :ok, location: @sound }
      else
        format.html { render :edit }
        format.json { render json: @sound.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_sound
    @sound = Sound.find(params[:id])
  end

  def sound_params
    params.require(:sound).permit(:title, :code, :description, :user_id, :public)
  end

end
