class AddIdToEventAttendee < ActiveRecord::Migration[6.0]
  def change
    add_column :event_attendees, :attendee_id, :integer
    add_column :event_attendees, :event_to_attend_id, :integer_
  end
end
