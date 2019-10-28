class User < ApplicationRecord
    before_save { self.email = email.downcase }
    has_secure_password
    validates :name, presence: true, length: { maximum: 50 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 255 },
                      format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
    validates :password, presence: true, length: { minimum: 6 }

    has_many :created_events, class_name: "Event", foreign_key: "creator_id"
    has_many :event_attendees, foreign_key: "attendee_id"
    has_many :event_to_attends, through: :event_attendees
end
