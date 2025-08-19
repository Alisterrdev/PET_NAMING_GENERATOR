class Animal < ApplicationRecord
  has_many :chats
  belongs_to :user
  validates :sex, presence: true
  validates :origin, presence: true
  validates :species, presence: true
  validates :color, presence: true
  validates :race, presence: true
end
