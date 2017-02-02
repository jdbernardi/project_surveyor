module SurveysHelper

	def error_taking_survey

		params[:error] ? "field_with_errors" : ""

	end


end
