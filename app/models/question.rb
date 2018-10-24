class Question < ApplicationRecord
	belongs_to :user
	has_many :articles, dependent: :destroy
	validates :user_id, presence: true
	validates :content , length: { minimum:5 }
end
