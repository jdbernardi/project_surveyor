class QuestionsController < ApplicationController

	def new

		@survey = Survey.new( params[:survey] )

		@question = Question.new

	end

end
