class QuestionsController < ApplicationController

	include QuestionsHelper

	def new
byebug
		@survey = Survey.find( params[:survey_id] )

		@question = Question.new


	end

	def show

	end

	def add_questions

		# 1 or 2 is passed via params for mc or range
		# survey id is also passed in
		@survey = Survey.find( params[:survey_id])

		@question = Question.create( survey_id: @survey.id )

		@question_type = question_type( params[:question] )

		@question_type.question_id = @question.id

		assign_type_to_question


	end


	def add_mc
byebug
		@survey = Survey.find( params["survey_id"])
		# pull question id
		@question = Question.find( params["question_id"])
		@question_type = pull_question_type
		# pull mc or range id or just this

	end


	def create_questions

		@survey = Survey.find( params["survey_id"])
		@question = Question.find( params["question_id"])
		@question_type = pull_question_type

		#update @question_type if multiple allowed
		save_multiple_allowed_to_question

		# generate multiple option objects for fields in form
		params['num_options'].to_i.times { @question.options.build  }


	end


	def update

		@question = Question.find( params[:id] )
		@survey = Survey.where( :id => @question.survey_id )

		add_options

		flash.notice = "Question added!"
byebug
		redirect_to new_question_path( @survey.id )

	end

end


private

  def whitelisted_question_params

		params.require(:question).permit(:question, "options_attributes"=>"option_text")


  end
