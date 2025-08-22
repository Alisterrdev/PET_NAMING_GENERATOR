class Message < ApplicationRecord
  belongs_to :chats
  has_one_attached :file
end
