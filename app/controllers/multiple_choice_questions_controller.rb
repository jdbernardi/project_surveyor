class MultipleChoiceQuestionsController < ApplicationController

	def new

		@survey = Survey.find(params[:survey_id])
		@mc_question = @survey.multiple_choice_questions.build


	end

	def new_options
byebug
		@question = MultipleChoiceQuestion.find( params[:question_id] )
		@options = @question.options.build

	end


	def create
byebug
		@survey = Survey.find( params[:survey_id])
		@mc_question = @survey.multiple_choice_questions.build( mc_params )
		byebug



		if @mc_question.save

			redirect_to new_options_path(:question_id => @mc_question.id)

		else

			render :new

		end


	end

end



private


	def mc_parmas
byebug
		params.require(:multiple_choice_question).permit(:num_options, :multiple_allowed, :survey_id, :required)

	end

