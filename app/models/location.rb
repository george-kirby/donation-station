class Location < ApplicationRecord
    has_many :donations

    def donations_count
        donations.count
    end

    def self.most_donations
        all.max_by{|location| location.donations_count}
    end
end
