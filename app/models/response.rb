class Response < ApplicationRecord
  belongs_to :user
  belongs_to :incident
  has_one_attached :image
end
