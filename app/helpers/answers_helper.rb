module AnswersHelper




	def generate_option_id_array( params_pairs )
		#ActionController::Parameters passed in here
		#take out the option ID so we can pass the same array to method for creating answers
		return [] if !params_pairs

		arr = []

		params_pairs.each_pair { | k, v| arr << v }

		return arr

	end

	def generate_checkbox_ids

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



end
