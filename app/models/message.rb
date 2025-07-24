class Message < ApplicationRecord
  belongs_to :user
  belongs_to :room
  has_rich_text :content

  after_create_commit -> { broadcast_append_to "room_messages_sub_#{self.room.id}", partial: "messages/message", locals: { room: room, message: self }, target: "messages" }
end
