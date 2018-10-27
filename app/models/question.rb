class Question < ApplicationRecord
	belongs_to :user
	has_many :articles, dependent: :destroy
	default_scope -> { order('created_at DESC') }
	validates :user_id, presence: true
	validates :content , length: { minimum:5 }

	def self.from_users_followed_by(user)
		followed_user_ids = "SELECT followed_id FROM relationships WHERE follower_id = :user_id"
		where("user_id IN (:#{followed_user_ids}) OR user_id = :user_id", user_id: user.id)
	end
end
