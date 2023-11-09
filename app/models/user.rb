class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    # 一位制をかける
    validates :email, uniqueness: true
    # @を含む記述があること
    validates :email, format: { with: /@/, message: "メールアドレスに「@」を挿入してください。" }
    # 6文字以上での入力が必須、および半角英数字混合での入力が必須であること
    validates :password, format: { with: /\A(?=.*[a-zA-Z])(?=.*\d)/, message: "is invalid. Include both letters and numbers" }, length: { minimum: 6 }
    # パスワードとパスワード（確認）は、値の一致が必須であること。
    validates :password_match
    # お名前（全角）は、全角（漢字・ひらがな・カタカナ）での入力が必須であること。
    validates :last_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "is invalid. Input full-width characters."}
    validates :first_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "is invalid. Input full-width characters."}
    # お名前カナ（全角）は、全角（カタカナ）での入力が必須であること。
    validates :last_name_kana, format: { with: /\A[ァ-ヶー]+\z/, message: "is invalid. Input full-width katakana characters." }
    validates :first_name_kana, format: { with: /\A[ァ-ヶー]+\z/, message: "is invalid. Input full-width katakana characters." }
  end
  
  validates :nickname, presence: true
  validates :birth_day, presence: true

  has_many :items
  has_many :orders

  def password_match
    if password.present? && password_confirmation.present? && password != password_confirmation
      errors.add(:password_confirmation, "パスワードとパスワード（確認）が一致しません")
    end
  end
 
  # with_options presence: true do
  #   validates :email, uniqueness: true
  #   validates :email, format: { with: /@/, message: "メールアドレスに「@」を挿入してください。" }
  #   validates :password, length: { minimum: 6 }
  #   validates :password, format: { with: /\A(?=.*[a-zA-Z])(?=.*\d)/, message: "is invalid. Include both letters and numbers" }
  #   validates :last_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "is invalid. Input full-width characters."}
  #   validates :first_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "is invalid. Input full-width characters."}
  #   validates :last_name_kana, format: { with: /\A[ァ-ヶー]+\z/, message: "is invalid. Input full-width katakana characters." }
  #   validates :first_name_kana, format: { with: /\A[ァ-ヶー]+\z/, message: "is invalid. Input full-width katakana characters." }
  # end
  
  # validates :nickname, presence: true
  # validates :birth_day, presence: true
  
  # has_many :items
  # has_many :orders
  
  # validate :password_match
  
  # def password_match
  #   if password.present? && password_confirmation.present? && password != password_confirmation
  #     errors.add(:password_confirmation, "パスワードとパスワード（確認）が一致しません")
  #   end
end
