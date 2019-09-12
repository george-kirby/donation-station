class Donation < ApplicationRecord
  belongs_to :user
  belongs_to :category
  belongs_to :location
  has_many :interests, dependent: :destroy
  has_many :users, through: :interests
  has_one_attached :picture

  validates :user, presence: true
  validates :title, presence: true
  validates :category, presence: true
  validates :location, presence: true

  def username
    self.user.username
  end

  def phone_number
    self.user.phone_number
  end

  def other_interests(user)
    interests.select{|interest| interest.user != user}
  end

  def self.most_interests
    all.max_by{|donation| donation.interests.count}
  end

end
