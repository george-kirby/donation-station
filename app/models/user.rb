class User < ApplicationRecord
    has_many :donations
    has_many :interests
    has_many :donations, through: :interests
end
