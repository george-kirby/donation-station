class Donation < ApplicationRecord
  belongs_to :user
  belongs_to :category
  belongs_to :location
  has_many :interests
  has_many :users, through: :interests
  has_one_attached :picture
end
