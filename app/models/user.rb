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

end