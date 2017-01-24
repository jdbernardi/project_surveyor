class RangeQuestion < ApplicationRecord

	belongs_to :survey
	has_many :options,  :as => :question
	belongs_to :answer

end
