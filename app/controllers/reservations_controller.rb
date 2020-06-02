class ReservationsController < ApplicationController

    before_action :set_reservation, only: [:show, :edit, :update,:destroy]
    before_action :require_user, except: [:show, :index]
    before_action :require_same_user, only: [:edit, :update,:destroy ]

      def show
       
      end
  
      def index
          @reservations = Reservation.paginate(page: params[:page], per_page: 5 )
      end
  
      def new
        @reservation = Reservation.new
      end
  
      def edit
        
      end
  
  
      def create
        @reservation = Reservation.new(reservation_params)
        @reservation.user = current_user
        if @reservation.save
          flash[:notice] = "La réservation a été enregistrée."
          redirect_to @reservation
        else
          render 'new'
        end
      end 
  
      def update
        if @reservation.update(reservation_params)
          flash[:notice]= "La réservation a été modifié"
          redirect_to @reservation
        else
          render 'edit'
        end
      end
  
      def destroy
        @reservation.destroy
        redirect_to reservations_path
      end
      private
      def set_reservation
      @reservation = Reservation.find(params[:id])
      end
  
      def reservation_params
        params.require(:reservation).permit(:arrival_date,:departure_date, :room_id, :room_request)
      end

      def require_same_user
        if current_user != @reservation.user && !current_user.admin?
          flash[:alert] ="Vous pouvez modifier vos réservations uniquement. "
          redirect_to @reservation

        end
      end

  end