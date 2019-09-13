class Event < ApplicationRecord
    validates :description, presence: true
    validates :time, presence: true
    validates :location, presence: true
    validate :date_cannot_be_past
    default_scope -> { order(created_at: :desc) }
    scope :upcoming, -> { where('time >= :now', {now: Time.now }) }
	scope :past, -> { where('time < :now', {now: Time.now}) } 

    belongs_to :creator, class_name: "User", foreign_key: "creator_id"
    has_many :event_attendees, foreign_key: "event_to_attend_id"
    has_many :attendees, through: :event_attendees

    private
	
	def date_cannot_be_past
		if time.present? && time < Date.today
			errors.add(:date, "can not be in the past.")
		end		
	end
end
