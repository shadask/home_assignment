
class WordStatisticsController < ApplicationController
	
	# If a user searches for a word then this function is called
	def index
	@word_statistics =  WordStatistic.search(word_statistic_params[:search])
	end	

	# Show word by its name through an API call 
	def show 
		requested_word = params[:id]
		fetched_word = WordStatistic.where(word: requested_word).first
		if fetched_word.nil?
			render json: {status: 'ERROR',message: 'word ' + requested_word + ' was not saved yet'}, status: :unprocessable_entity
		else
			render json: {status: 'SUCCESS',message: 'count of a word ' + requested_word + ' ', data: fetched_word.count}, status: :ok
		end 
	end	
	
	# Delete by word by ID
	def destroy
		word = WordStatistic.find(params[:id])
		word.destroy
		render json: {status: 'SUCCESS',message: 'word was deleted'}, status: :ok 
	end

	private

	def word_statistic_params
		params.permit(:word, :count, :search)
	end

end

