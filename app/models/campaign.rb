class Campaign < ApplicationRecord
    belongs_to :user

    scope :user_campaigns, ->(user) { where(['user_id = ?', user.id]) }
end
