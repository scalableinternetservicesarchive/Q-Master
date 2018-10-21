class Article < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  default_scope -> { order('created_at DESC')}
  validates :title, presence: true,
                    length: { minimum: 5 }
  validates :user_id, presence: true
  validates :text, presence: true,
  						 length: { maximum: 140 }
end
