class QuestionsController < ApplicationController

	include QuestionsHelper

	def new

		@survey = Survey.find( params[:survey_id] )


	end

	def show

	end

	def add_questions

		# question 1 or 2 is passed via params
		# survey id is also passed in
		@survey = Survey.find( params[:survey_id])

		@question = Question.new( survey_id: @survey.id )
		@question.save


		@question_type = question_type( params[:question] )

		@question_type.question_id = @question.id

		assign_type_to_question

		@question.save

		@question_type.save

		# need to save the mc or range

		# need to save question to generate id
		# assign the question id to mc or range

	end


	def add_mc

		@survey = Survey.find( params["survey_id"])
		# pull question id
		@question = Question.find( params["question_id"])
		@question_type = pull_question_type
		# pull mc or range id or just this

	end


	def create_questions

		@survey = Survey.find( params["survey_id"])
		# pull question id
		@question = Question.find( params["question_id"])
		@question_type = pull_question_type


		params['num_options'].to_i.times { @question.options.build  }

byebug
		 #@options = Option.where( question_id: @question.id )

	end


	def update
byebug
	end

end

