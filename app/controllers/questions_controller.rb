class QuestionsController < ApplicationController

	include QuestionsHelper

	def index

		@survey = Survey.find( params[:survey_id] )
		@questions = Question.where( :survey_id => @survey_id)


	end


	def new

byebug
		@survey = Survey.find( params[:survey_id] )
		@question = @survey.questions.build

		params['num_options'].to_i.times { @question.options.build  }

		#generate the build for this new form using the create questions action

	end



	def add_number_of_questions


	end


	def add_mc

		@survey = Survey.find( params["survey_id"])
		# pull question id
		@question = Question.find( params["question_id"])
		@question_type = pull_question_type
		# pull mc or range id or just this

	end


	def create_questions
byebug
		@survey = Survey.find( params["survey_id"])
		@question = Question.find( params["question_id"])
		@question_type = pull_question_type
byebug
		#update @question_type if multiple allowed
		save_multiple_allowed_to_question

		# generate multiple option objects for fields in form
		params['num_options'].to_i.times { @question.options.build  }


	end


	def update
byebug

		@question = Question.find( params[:id] )
		byebug
		add_options

		flash.notice = "Question added!"

		redirect_to questions_path( survey_id: @question.survey_id )

	end

end


private

  def whitelisted_question_params

		params.require(:question).permit(:question, "options_attributes"=>"option_text")


  end
