class Topic < ApplicationRecord
    # バリデーション
    validates :user_id, presence: true
    validates :description, presence: true
    validates :image, presence: true
    
    # リレーション
    belongs_to :user
end
