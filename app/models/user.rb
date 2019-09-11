class User < ApplicationRecord
    has_many :donations
    has_many :interests
    has_many :donations, through: :interests

    validates :username, presence: true
    validates :username, uniqueness: true
    validates :username, length: {minimum: 3}

    validates :phone_number, presence: true
    validates :phone_number, uniqueness: true
    validates :phone_number, format: {with: /\d/, message: "only allows digits"}
    validates :phone_number, length: {is: 11, message: "must be 11 digits long"}

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

    def contact_permission?(user)
        Interest.all.any?{|interest| interest.donation.user == user && interest.user == self}
    end

    def donations_count
        my_donations.count
    end

    def self.most_donations
        all.max_by{|user| user.donations_count}
    end

    def my_donations_with_interest
        my_donations.select{|donation| !donation.interests.empty?}
    end

    def interests_received
        Interest.all.select{|interest| interest.donation.user == self}
    end

    def self.most_interests_received
        all.max_by{|user| user.interests_received.count}
    end

end