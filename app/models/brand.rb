class Brand < ActiveRecord::Base
  has_many :models, dependent: :destroy

  validates_presence_of :webmotors_id, :name
end
