class SessionsController < ApplicationController

	def new
	end

	def create
			user= User.find_by(email: params[:session][:email].downcase)
			if 
				user && user.authenticate(params[:session][:password])
				session[:user_id] = user.id
				flash[:alert] = "Connexion réussit!"
				redirect_to user
			else 
				flash.now[:alert] = "Il y a une erreurs avec les informations entrée. Réessayer s'il vous plaît"
				render "new"
			end
	end
	
	def destroy
		session[:user_id] = nil
		flash[:notice] = "Vous êtes déconnectée"
		redirect_to root_path
end
end


