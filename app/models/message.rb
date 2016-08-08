class Message < ActiveRecord::Base
  validates :sender_id, presence: true
  validates :recipient_id, presence: true
  belongs_to :messageable, polymorphic: true

  MESSAGE_TYPES = [ "image", "video", "text"]

  scope :between, -> (sender_id, recipient_id) do
        where("(messages.sender_id = ? AND messages.recipient_id = ?) OR (messages.sender_id = ? AND messages.recipient_id = ?)",
              sender_id, recipient_id, recipient_id, sender_id)
  end
end
