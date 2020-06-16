class RoomsController < ApplicationController  

    before_action :set_room, only: [:show, :edit, :update, :destroy]
  
    def index
      @rooms = Room.all
    end
    
    def show
      
    end
  
    def new
      @room = Room.new
    end
  
    def edit
      
    end
    
  
    def create
      @room = Room.new(room_params)
      if @room.save
        flash[:notice] = "La chambre a été sauvegardé! "
        redirect_to @room
      else
        render 'new'
      end
    end
  
  
    def update
      
      if @room.update(room_params)
        flash[:notice] = "La chambre a été modifiée."
        redirect_to @room
      else
        render 'edit'
      end
    end
  
    def destroy
     
      @room.destroy
      redirect_to rooms_path
    end 
  
    private
    def set_room
      @room = Room.find(params[:id])
    end 
  
    def room_params
      params.require(:room).permit(:room_id, :room_description, :room_price)
    end
  end
  