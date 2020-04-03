class DirectMessage < ApplicationRecord

    belongs_to :user

    validates :sender_id, presence: true
    validates :reciever_id, presence: true
    validates :message, presence: true
end
