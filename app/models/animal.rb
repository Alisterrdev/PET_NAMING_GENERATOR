class Animal < ApplicationRecord
  has_many :chats, dependent: :destroy
  has_many :messages, dependent: :destroy
  belongs_to :user
end
