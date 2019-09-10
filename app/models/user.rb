class User < ApplicationRecord
    has_many :donations
    has_many :interests
    has_many :donations, through: :interests

    validates :username, presence: true
    validates :username, uniqueness: true
    validates :password, presence: true
    validates :password, confirmation: { case_sensitive: true}

    def self.usernames
        self.all.map{|user| user.username}
    end

    def interest_shown?(donation)
        Interest.all.any?{|interest| interest.donation == donation && interest.user == self}
    end

    def my_donations
        Donation.all.select{|donation| donation.user == self}
    end

end