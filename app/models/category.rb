class Category < ApplicationRecord
    has_many :donations

    def donations_count
        donations.count
    end

    def self.most_donations
        all.max_by{|category| category.donations_count}
    end
end
