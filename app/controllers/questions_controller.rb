class QuestionsController < ApplicationController

	def new

		@survey = Survey.find( params[:survey_id] )


	end

	def add_questions



byebug
	end




end
