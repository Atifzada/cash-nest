class Cash < ApplicationRecord
  belongs_to :user
  has_many :group_cashes, dependent: :destroy
  has_many :groups, through: :group_cashes
  validates :name, presence: true
  validates :amount, presence: true, numericality: true
end
