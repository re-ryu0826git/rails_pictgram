class User < ApplicationRecord

  #未入力か判定
  validates :name, presence: true, length: { maximum: 15 } 
  validates :email, presence: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  
  
  #パスワード機能を実装
  has_secure_password
  
  # パスワードバリデーション
  validates :password, length: { in: 8..32 }, format: { with: /\A[a-z0-9]+\z/ }

  # リレーション
  has_many :topics
  has_many :favorites
  
  # throughを使用することで1人ユーザがいいねしたTopicデータ全てを取得
  has_many :favorite_topics, through: :favorites, source: 'topic'

  
end
