class Character < ApplicationRecord
  belongs_to :campaign
  has_one_attached :image
  validates :name, :campaign, presence: true
end
