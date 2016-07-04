class Model < ActiveRecord::Base
  belongs_to :brand

  validates_presence_of :brand_id, :name
end
