class SurveysController < ApplicationController

	include SurveysHelper

	def index

		@surveys = Survey.all

	end


	def new

		@survey = Survey.new

	end


	def create

		@survey = Survey.new( whitelisted_survey_params )

		if @survey.save

			flash[:success] = "created survey"

			redirect_to question_types_path( :survey_id => @survey.id )

		else

			flash.now[:error] = "Failed to create survey!"
			render :new

		end

	end

	def take

		@survey = Survey.find( params[ :id ] )
		@mcs = @survey.multiple_choice_questions

	end


	def update

		@survey = Survey.find( params[:id] )

	end


end





private

	def take_params
		# example from MCPARAMS
		params.require('multiple_choice_question').
			permit(:id,
						 :text,
						 { :options_attributes => [
						 	 :option_text
						 	] } )

	end


  def whitelisted_survey_params

    params.require(:survey).permit( :title,
              :description )
  end