class Topic < ApplicationRecord
    # バリデーション
    validates :user_id, presence: true
    validates :description, presence: true
    validates :image, presence: true
    
    # リレーション
    belongs_to :user
    has_many :favorites
    
    # 画像をアップロードする
    mount_uploader :image, ImageUploader
end
