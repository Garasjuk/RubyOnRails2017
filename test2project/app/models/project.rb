class Project < ApplicationRecord
	has_many :tasks, dependent: :destroy
	validates :name, presence: true, length: {minimum: 3}
	validates :summary, presence: true, length: {minimum: 10}
	
	
end
