class Invite < ApplicationRecord
  belongs_to :event
  belongs_to :user, optional: true

  validates :email, uniqueness: { scope: :event, message: "You can only invite a person once" }
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, message: "Invalid email format."
  validates :message, presence: { message: "Must have a message." }
end
