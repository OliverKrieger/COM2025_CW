class Character < ApplicationRecord
  belongs_to :campaign
  validates :name, :campaign, presence: true
end
