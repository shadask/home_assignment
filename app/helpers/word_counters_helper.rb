module WordCountersHelper
    
    # Count word appearances amount in a given string and save to db
    def count_words_in_string(string)
        words = string.split(' ')
        for word in words do
            word.downcase!
            word_stats = WordStatistic.where(word: word).first
                if !word_stats.nil?
                    word_stats.count+=1
                    word_stats.save!
                else
                    WordStatistic.create(word: word, count: 1)
                end
            end
    end

    def count_words_in_file(file_path)
        file = File.open(file_path, "r")
        file.each_line { |line| count_words_in_string(line)}
    end

    # Checking if the string is a URL
    def uri?(string)
        uri = URI.parse(string)
        %w( http https ).include?(uri.scheme)
        rescue URI::BadURIError
        false
        rescue URI::InvalidURIError
        false
    end

    # Get the URL
    def process_url(input)
        page_content = open(input) { 
            |io| data = io.read
            count_words_in_string(data)
            }
        end    
    
    end

