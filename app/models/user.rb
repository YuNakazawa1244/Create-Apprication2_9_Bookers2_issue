class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books,dependent: :destroy
  has_many :favorites,dependent: :destroy
  has_many :post_comments,dependent: :destroy

# 以下フォローフォロワー機能
　has_many :xxx,class_name:"Hogeモデル名",foreign_key:"follower_id",dependent: :destroy

　has_many :yyy,through: :xxx,source: :zzz
# ここまで

  attachment :profile_image

  validates :name, uniqueness: true, length: { in: 2..20 }
  validates :introduction, length: {maximum: 50}

end
