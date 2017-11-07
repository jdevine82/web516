class SessionsController < ApplicationController
  def new

  end
  def create
     officer = Officer.find_by(id: params[:session][:id])
    if officer && officer.authenticate(params[:session][:password])
      # Log the user in and redirect to the user's show page.
        log_in officer
      redirect_to officer

    else
      # Create an error message.
      render 'new'
    end
  end
  
  def destroy
      log_out
    redirect_to root_url

  end
end
