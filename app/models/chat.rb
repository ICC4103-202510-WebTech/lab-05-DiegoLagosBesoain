class Chat < ApplicationRecord
    
    has_many :messages
    belongs_to :receiver, class_name: 'User', foreign_key: 'receiver_id'
    belongs_to :sender, class_name: 'User', foreign_key: 'sender_id'
    validates :receiver_id, presence: true  
    validates :sender_id, presence: true
    validate :sender_and_receiver_cannot_be_the_same
    scope :involving, ->(user) {
    where("sender_id = ? OR receiver_id = ?", user.id, user.id)
    }
    def other_user(current_user)
      sender == current_user ? receiver : sender
    end
    private

    def sender_and_receiver_cannot_be_the_same
        if sender_id == receiver_id
        errors.add(:receiver_id, "no puede ser igual al remitente")
        end
    end
    

end