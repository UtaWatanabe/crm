class Company < ActiveRecord::Base
  has_many :customers
  # 個人との関連付け｡複数形であることに注意｡

end
