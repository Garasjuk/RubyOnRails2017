class Comment < ApplicationRecord
	belongs_to :tasks
	validates :body, presence: true, length: { minimum: 5 }
end
