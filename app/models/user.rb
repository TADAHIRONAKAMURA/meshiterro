class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  #devise の後の：(セミコロン)で始まる名前がdeviseの機能名です。
  #今回は実装しないrecoverable（パスワードリセット）もrememberable（ログイン情報を保存する）も
  #記述されていますが、デフォルトの記述なので、このままで進めていきます。
  #ここの説明は「作成したUserモデルにdeviseで使用する機能を記述する」です。
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  #has_manyの後には1:Nの関係になるモデル名の複数形を記述
  has_many :post_images
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

    attachment :profile_image




end


