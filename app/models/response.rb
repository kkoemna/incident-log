class Response < ApplicationRecord
  validates :date,    presence: true
  validates :title,   presence: true
  validates :content, presence: true
  validates :cost,    presence: true
  belongs_to :user
  belongs_to :incident
  has_one_attached :image
end