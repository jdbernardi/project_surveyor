class QuestionsController < ApplicationController

	def new

		@survey = Survey.find( params[:survey_id] )


	end

	def add_questions

		# question 1 or 2 is passed via params
		# survey id is also passed in
		@survey = Survey.find( params[:survey_id])


	end


	def add_mc


	end

end
