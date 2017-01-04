class SurveysController < ApplicationController

	def index

	end

	def new

		@survey = Survey.new


	end

	def create

		@survey = Survey.new( whitelisted_survey_params )

		if @survey.save

			flash[:success] = "created survey"

			redirect_to surveys_path

		else

			flash.now[:error] = "Failed to create survey!"
			render :new

		end

	end

end



private

  def whitelisted_survey_params

    params.require(:survey).permit( :title,
              :description )
  end