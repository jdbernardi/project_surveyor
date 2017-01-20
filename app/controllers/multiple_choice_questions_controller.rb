class MultipleChoiceQuestionsController < ApplicationController

	def new

		@survey = Survey.find(params[:survey_id])
		@mc_question = MultipleChoiceQuestion.new
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

