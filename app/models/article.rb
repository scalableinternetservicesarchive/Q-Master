class Article < ApplicationRecord
  belongs_to :user
  belongs_to :question
  has_many :comments, dependent: :destroy
  default_scope -> { order('created_at DESC')}
  validates :user_id, presence: true
  validates :question_id, presence: true
  validates :text, presence: true,
  						 length: { maximum: 140 }
end
