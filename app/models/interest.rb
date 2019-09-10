class Interest < ApplicationRecord
  belongs_to :user
  belongs_to :donation

  validates :user_id, presence: true
  validates :donation_id, presence: true

  def user_phone_number
    user.phone_number
  end

  def username
    user.username
  end
end
