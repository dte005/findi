class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :suggestion

  validates :user, uniqueness: { scope: :suggestion, message: "You can only vote once" }
end
