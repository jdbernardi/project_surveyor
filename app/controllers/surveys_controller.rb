class SurveysController < ApplicationController

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

			#explicitly named route

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
byebug
		@survey = Survey.find( params[:id] )
=begin
<ActionController::Parameters {"utf8"=>"✓", "_method"=>"patch", "authenticity_token"=>"dDTJoLv73dX/i0fGnOwccCPyx2E9gTTzj3vCu1DKN49wmIcSTu/T3irFrVBH1Hqi0ur4VwchqlfRt9XaLcmUvg==", "option"=>{"262"=>"389"}, "survey"=>{"multiple_choice_question"=>{"option_ids"=>["", "392", "394", "", "397", "", "402"]}}, "commit"=>"Finish Survey", "controller"=>"surveys", "action"=>"update", "id"=>"234"} permitted: false>
=end
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