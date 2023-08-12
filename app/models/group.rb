class Group < ApplicationRecord
  belongs_to :user
  has_many :group_cashes, dependent: :destroy
  has_many :cashes, through: :group_cashes

  validates :name, presence: true
  validates :icon, presence: true

  has_one_attached :icon
end
