module AnswersHelper


	def pull_radio_ids( params_pairs )

		return [] if !params_pairs

		arr = []

		params_pairs.each_pair { | k, v| arr << v }

		return arr

	end

	def pull_checkbox_ids

		params[:checkbox_op_ids] ? params[:checkbox_op_ids] : []


	end

	def create_answers( responses )

		return if !responses

		responses.each do | v |
			# v = option_id
			option = Option.find( v )
			answer = option.answers.build
			answer.save
		end

	end


	def required_questions_answered( answers )

		# start with all the multi choice questions
		mcs = @survey.multiple_choice_questions
		# create int of option ids to check with questions
		answers_int = answers.map(&:to_i)

		mcs.each do | mc |

			if mc.required && ( answers_int & mc.options.ids).empty?

			  return false

			end

		end


	end


end
