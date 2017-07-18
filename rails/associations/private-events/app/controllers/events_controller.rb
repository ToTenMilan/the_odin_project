class EventsController < ApplicationController

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @user = current_user
    @event = @user.created_events.build(event_params)
    # @event.place = Faker::University.name
    @event.date = 1.week.from_now
    @event.save
    flash[:success] = "Event has been succesfully saved"
    redirect_to events_path
  end

  private
    def event_params
      params.require(:event).permit(:name, :description)
    end
end
