class Event < ApplicationRecord
  belongs_to :user
  has_many :suggestions, dependent: :destroy
  has_many :invites, dependent: :destroy
  has_many :messages, dependent: :destroy



  mount_uploader :photo, PhotoUploader
end
