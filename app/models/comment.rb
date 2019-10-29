class Comment < ApplicationRecord
  # リレーション
  belongs_to :user
  belongs_to :topic
  
  # バリデーション
  validates :content, presence: true
end
