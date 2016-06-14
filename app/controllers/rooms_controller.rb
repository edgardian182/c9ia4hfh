class RoomsController < ApplicationController

  before_action :select_room, only:[:edit, :update, :destroy]

  def index
    @rooms = Room.all
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to rooms_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @room.update(room_params)
      redirect_to rooms_path
    else
      render 'edit'
    end
  end

  def destroy
    @room.destroy
    redirect_to rooms_path
  end

  protected

    def select_room
      @room = Room.find_by(params[:id])
    end

    def room_params
      params.require(:room).permit(:title, :description, :beds, :guests, :image_url, :price_per_night)
    end
end
