class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :invites
  has_many :owned_events, class_name: "Event"
  has_many :events, through: :invites
  has_many :messages
end
