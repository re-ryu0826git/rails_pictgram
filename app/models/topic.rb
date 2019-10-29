class Topic < ApplicationRecord
    # バリデーション
    validates :user_id, presence: true
    validates :description, presence: true
    validates :image, presence: true
    
    # リレーション
    belongs_to :user
    has_many :favorites
    has_many :favorite_users, through: :favorites, source: 'user'
    
    # コメント機能のリレーション
    has_many :comments
    
    # 画像をアップロードする
    mount_uploader :image, ImageUploader
end
