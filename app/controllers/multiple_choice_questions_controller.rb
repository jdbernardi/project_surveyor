class MultipleChoiceQuestionsController < ApplicationController

	def new
byebug
		@survey = Survey.find(params[:survey_id])
		@mc_question = @survey.multiple_choice_questions.build
byebug

	end


	def create

byebug

	end

end



private


	def mc_parmas

		params.require(:multiple_choice_question).permit(:num_options, :multiple_allowed)

	end

