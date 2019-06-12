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
  has_many :votes, dependent: :destroy

  mount_uploader :photo, PhotoUploader
  validates_format_of :email, with: /A([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)z/i

  private

  def send_welcome_email
    UserMailer.with(user: self).welcome.deliver_now
  end
end
