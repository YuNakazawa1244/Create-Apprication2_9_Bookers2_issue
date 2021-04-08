class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books,dependent: :destroy
  has_many :favorites,dependent: :destroy
  has_many :post_comments,dependent: :destroy

# 以下フォローフォロワー機能
  has_many :follower, class_name: "Relationship",foreign_key: "follower_id", dependent: :destroy
  has_many :followed, class_name: "Relationship",foreign_key: "followed_id", dependent: :destroy

  has_many :following, through: :follower, source: :followed #自分がフォローしている人
  has_many :followers, through: :followed, source: :follower #自分をフォローしている人

  #ユーザーをフォローする
  def follow(user_id)
    follower.create(followed_id: user_id)
  end

  #ユーザーのフォローを外す
  def unfollow(user_id)
    follower.find_by(followed_id: user_id).destroy
  end

  #フォローしていればtrueを返す
  def following?(user)
    following.include?(user)
  end

# ここまで

  attachment :profile_image

  validates :name, uniqueness: true, length: { in: 2..20 }
  validates :introduction, length: {maximum: 50}

end
