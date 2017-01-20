class MultipleChoiceQuestionsController < ApplicationController

	def new

		@survey = Survey.find(params[:survey_id])
		@mc_question = MultipleChoiceQuestion.new
byebug
	end

end
