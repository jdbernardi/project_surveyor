class QuestionsController < ApplicationController

	include QuestionsHelper

	def new

		@survey = Survey.find( params[:survey_id] )


	end

	def add_questions

		# question 1 or 2 is passed via params
		# survey id is also passed in
		@survey = Survey.find( params[:survey_id])

		@question = Question.new( survey_id: @survey.id )

		@question_type = question_type( params[:question] )
		@question_type.question_id = @question.id

		# need to save the mc or range
byebug
		# need to save question to generate id
		# assign the question id to mc or range

	end


	def add_mc

		# pull question id
		# pull mc or range id or just this
byebug
	end

end

