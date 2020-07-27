require 'open-uri'

class WordCountersController < ApplicationController
	
	def new
		@word_counters = WordCounters.new
	end
	
	# Update the count for each word in an input
	# It handles strings, files and URL data
	def create
		input = params[:word_counter][:input]
		
		# Checking if the input is a URL and getting its content
		if(helpers.uri?(input))
			helpers.process_url(input) 
		# Check if the string is a file path
		elsif File.file?(input)					
			helpers.count_words_in_file(input)
		else
			helpers.count_words_in_string(input)
		end
		redirect_to :controller => 'word_counters', :action => 'index', notice: 'Word statistic was successfully created.'
		
	end

	def word_counter_params
		params.permit(:input)
	end

end

