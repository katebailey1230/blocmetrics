class EventsController < ApplicationController
  def create
    @registered_application = RegisteredApplication.find(params[:registered_application_id])
    @event = @registered_application.event.new(event_params)

    if @event.save
      flash[:notice] = "Event saved successfully."
      redirect_to @registered_application
    else
      flash[:alert] = "There was an error saving the event."
      redirect_to @registered_application
  end

  def show
    @registered_application = RegisteredApplication.find(params[:registered_application_id])
    @events = @registered_application.event.new(event_params)

  private

  def event_params
    params.permit(:name)
  end

end
end
