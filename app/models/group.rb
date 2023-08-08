class Group < ApplicationRecord
  has_many :group_wallets
  has_many :cash, through: :group_cash
end
