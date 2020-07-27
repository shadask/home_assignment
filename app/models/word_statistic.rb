class WordStatistic < ApplicationRecord

    def self.search(search)
        if search
            self.where(word: search)
        else
            WordStatistic.all
        end 
    end

end
