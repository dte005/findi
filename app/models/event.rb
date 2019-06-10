class Event < ApplicationRecord
  belongs_to :user
  has_many :suggestions, dependent: :destroy
  has_many :invites, dependent: :destroy
  has_many :messages, dependent: :destroy
  validates :title, presence: true
  validates :date, presence: true

  mount_uploader :photo, PhotoUploader
end
