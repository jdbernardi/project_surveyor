class QuestionsController < ApplicationController

	include QuestionsHelper

	def new

		@survey = Survey.find( params[:survey_id] )


	end

	def add_questions

		# question 1 or 2 is passed via params
		# survey id is also passed in
		@survey = Survey.find( params[:survey_id])

		@question = Question.new

		@question_type = question_type( params[:question] )

		byebug

	end


	def add_mc


	end

end

