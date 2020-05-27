class WelcomeController < ApplicationController

  def index
    redirect_to reservations_path if logged_in?
  end

end
