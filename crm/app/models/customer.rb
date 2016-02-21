class Customer < ActiveRecord::Base
  belongs_to :company
  # 会社との関連付け｡

  validates :family_name,
    presence: true, length: { maximum: 20 }
  validates :given_name,
    presence: true, length: { maximum: 20 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  # メールアドレスをvaridationする正規表現
  validates :email,
    presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: true

  #Customerモデルにcompany_idのバリデーションを追加してください（presence）
  validates :company_id,
    presence: true

  def full_name
    full_name = family_name + given_name + ' 様'
    return full_name
    #RubyはReturnがなくても値が返ってくるので､4行目が無くても動く
  end
end
