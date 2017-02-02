module ApplicationHelper

	def required?( question )

		question.required ? "*" : ""

	end

	def total_responses( survey )

		return if !survey.multiple_choice_questions

		total = []

		survey.multiple_choice_questions.each do | mc |

			mc.options.each do | option |

				total << option.answers.count

			end

		end

		return total.inject( 0 ) { |r,e| r + e }

	end

end
