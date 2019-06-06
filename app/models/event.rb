class Event < ApplicationRecord
  belongs_to :user
  has_many :suggestions
  has_many :invites

  mount_uploader :photo, PhotoUploader
end
