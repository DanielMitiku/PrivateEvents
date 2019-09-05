class Event < ApplicationRecord
    validates :description, presence: true
    validates :time, presence: true
    validates :location, presence: true

    belongs_to :creator, class_name: "User", foreign_key: "creator_id"
end
