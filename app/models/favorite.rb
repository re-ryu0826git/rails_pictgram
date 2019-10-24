class Favorite < ApplicationRecord
    
    # バリデーションを作成
    validates :user_id, {presence: true}
    validates :topic_id, {presence: true}
    
    # リレーション
    belongs_to :user
    belongs_to :topic
    
    
end
