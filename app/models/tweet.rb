class Tweet < ApplicationRecord

    belongs_to :user
    has_many :likes

    validates :tweet, {presence: true, length: {maximum: 140}}
    validates :user_id, {presence: true}
    
    def user
      return User.find_by(id: self.user_id)
    end
end
