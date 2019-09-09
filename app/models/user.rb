class User < ApplicationRecord
    has_many :donations
    has_many :interests
    has_many :donations, through: :interests

    def self.usernames
        self.all.map{|user| user.username}
    end

end
