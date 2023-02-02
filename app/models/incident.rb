class Incident < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  validates :title,    presence: true
  validates :content,  presence: true
  validates :date,     presence: true
  validates :place_id, numericality: { other_than: 0 , message: "can't be blank" }
  belongs_to :user
  belongs_to :place
  has_one_attached :image
end
