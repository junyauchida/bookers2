class Book < ApplicationRecord

	belongs_to :user

	validates :title,
# バリデーション　# validates 検証するフィールド名, 条件
  presence:true,
# 存在するならtrue
	length:{maximum:199}
# 値が199文字以下

	validates :opinion,
# バリデーション　# validates 検証するフィールド名, 条件
  presence:true,
# 存在するならtrue
	length:{maximum:199}
# 値が199文字以下

end

