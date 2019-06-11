class Event < ApplicationRecord
  belongs_to :user
  has_many :suggestions, dependent: :destroy
  has_many :invites, dependent: :destroy
  has_many :messages, dependent: :destroy
  validates :title, presence: true, length: { maximum: 40, too_long: "Title must have at most %{count} characters." }
  validates :date, presence: true
  validates :description, presence: true, length: { maximum: 150, too_long: "Description must have at most %{count} characters." }

  geocoded_by :address
  # after_validation :geocode, if: :will_save_change_to_address?


  mount_uploader :photo, PhotoUploader
end
