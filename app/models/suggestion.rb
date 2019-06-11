class Suggestion < ApplicationRecord
  belongs_to :event
  validates :title, presence: true, length: { maximum: 40, too_long: "Suggestion title must have at most 40 characters." }
  validates :address, presence: { message: "Suggestion must have an address." }

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
