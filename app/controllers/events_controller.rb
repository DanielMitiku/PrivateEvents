class EventsController < ApplicationController
  before_action :logged_in_user, only: [:new, :edit, :update, :create, :destroy]
  before_action :correct_user,   only: [:destroy, :edit, :update]

  def new
    @event  = current_user.created_events.new
  end

  def index
    @events = Event.paginate(page: params[:page])
  end

  def create
    @event = current_user.created_events.build(event_params)
    if @event.save
      flash[:success] = "Event has been created!"
      redirect_to @event
    else
      render 'new'
    end
  end

  def edit
    @event = current_user.created_events.find(params[:id])
  end

  def update
    @event = current_user.created_events.find(params[:id])
    if @event.update_attributes(event_params)
      flash[:success] = "Event updated"
      redirect_to @event
    else
      render 'edit'
    end
  end

  def destroy
    @event = current_user.created_events.find(params[:id])
    if @event 
      @event.destroy
      flash[:success] = "Event has been deleted"
    else
      flash[:alert] = "Error"
    end
    redirect_to root_path
  end

  def show
    @event = Event.find(params[:id])
  end

  private

  def event_params
    params.require(:event).permit(:description, :location, :time)
  end

  def correct_user
    @event = current_user.created_events.find_by(id: params[:id])
    redirect_to root_url if @event.nil?
  end


end
