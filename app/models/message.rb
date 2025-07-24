class Message < ApplicationRecord
  belongs_to :user
  belongs_to :room
  has_rich_text :content
end
