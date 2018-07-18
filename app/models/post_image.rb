class PostImage < ApplicationRecord
	# ここを追加（_idは含めません）
    attachment :image
 # belongs_toはPostImageモデルからuser_idに紐づいてUserモデルを参照できる
	belongs_to :user
    has_many :favorites, dependent: :destroy
	has_many :post_comments, dependent: :destroy

    validates :shop_name, presence: true
    validates :image, presence: true

    def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
    end

end
