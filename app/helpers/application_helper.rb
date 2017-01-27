module ApplicationHelper

	def required?( question )

		question.required ? "*" : ""

	end

end
