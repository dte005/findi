class User < ApplicationRecord
  after_create :send_welcome_email
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :invites, dependent: :destroy
  has_many :owned_events, class_name: "Event", dependent: :destroy
  has_many :events, through: :invites
  has_many :messages, dependent: :destroy

  mount_uploader :photo, PhotoUploader

  private

  def send_welcome_email
    UserMailer.with(user: self).welcome.deliver_now
  end
end
