class Suggestion < ApplicationRecord
  belongs_to :event
  validates :title, presence: true, length: { maximum: 40, too_long: "Suggestion title must have at most 40 characters." }
  validates :address, presence: { message: "Suggestion must have an address." }

end
