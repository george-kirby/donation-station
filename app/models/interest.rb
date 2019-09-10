class Interest < ApplicationRecord
  belongs_to :user
  belongs_to :donation

  validates :user_id, presence: true
  validates :donation_id, presence: true
end
