class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

has_many :books

validates :name,
# バリデーション　# validates 検証するフィールド名, 条件
  presence:true,
# 存在するならtrue
	length:{in:2..20}
# 値が2以上20文字以下

validates :intro,
# 存在するならtrue
    length: { maximum: 50 }
# 自己紹介、50文字以上はエラー　→ 49まで

 def email_required?
   false
 end
 def email_changed?
   false
 end
 # deviseでemailを不必要にする

attachment :profile_image
attachment :image #attachmentメソッド

end
