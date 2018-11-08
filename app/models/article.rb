class Article < ApplicationRecord
  belongs_to :user
  belongs_to :question
  has_many :comments, dependent: :destroy
  default_scope -> { order('cached_votes_up DESC')}
  mount_uploader :picture, PictureUploader
  validates :user_id, presence: true
  validates :question_id, presence: true
  validates :text, presence: true,
  						 length: { maximum: 140 }
  validate :picture_size
  acts_as_votable
  def picture_size
    if picture.size > 5.megabytes
      errors.add(:picture, "should be less than 5MB")
    end
  end

end
