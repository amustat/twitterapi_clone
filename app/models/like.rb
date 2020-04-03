class Like < ApplicationRecord

    belongs_to :user
    belongs_to :tweet

    validates :user_id, {presence: true}
    validates :post_id, {presence: true}
end
