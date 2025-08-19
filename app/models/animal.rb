class Animal < ApplicationRecord
  has_many :chats
  belongs_to :users
end
