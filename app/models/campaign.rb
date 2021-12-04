class Campaign < ApplicationRecord
    belongs_to :user
    has_many :characters, dependent: :destroy
    has_one_attached :image
    validates :name, presence: true
    validates :name, uniqueness: true
    scope :user_campaigns, ->(user) { where(['user_id = ?', user.id]) }
end
