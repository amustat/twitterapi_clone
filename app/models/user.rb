class User < ApplicationRecord
    has_secure_password
  
    has_many :tweets
    has_many :likes 
    has_many :relations
    has_many :direct_messages

    validates :name, {presence: true}
    validates :email, {presence: true, uniqueness: true}
    
    
    def tweets
      return Tweet.where(user_id: self.id)
    end

    def followers
        return User.where(follower_user_id: self.id)
    

end
