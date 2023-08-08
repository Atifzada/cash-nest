class Cash < ApplicationRecord
  belongs_to :user
  has_many :groups, through: :group_entities
end
