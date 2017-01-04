class Survey < ApplicationRecord

	validates :title, presence: true, uniqueness: true
	validates :description, presence: true


	has_many :questions
	has_many :answers
	has_many :options

end
