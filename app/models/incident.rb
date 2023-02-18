class Incident < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  validates :date,     presence: true
  validates :title,    presence: true
  validates :content,  presence: true
  validates :place_id, numericality: { other_than: 0 , message: "can't be blank" }
  belongs_to :user
  belongs_to :place
  has_one_attached :image
  has_one :response, dependent: :destroy
  has_many :comments, dependent: :destroy

  def self.search(search)
    if search != ""
      Incident.where('content LIKE(?)', "%#{search}%")
    else
      Incident.all
    end
  end
end