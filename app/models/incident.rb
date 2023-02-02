class Incident < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  validates :place_id, numericality: { other_than: 0 , message: "can't be blank"}
  belongs_to :user
  belongs_to :place
end
