class EventAttendeesController < ApplicationController
  def create
    @event_att = Event.find_by(id: params[:event_attendees][:id])
    if !current_user.event_to_attend_ids.include?(@event_att) && (@event_att.time > Date.today)
      flash[:success] = "Your name is added to the attendees list"
      @event_att.event_attendees.create(attendee_id: current_user.id)
      redirect_to @event_att
    else 
      flash[:danger] = "Can't Attend Event"
      redirect_to @event_att
    end
  end
end
