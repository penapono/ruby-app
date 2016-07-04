class BrandsController < ApplicationController
  expose(:brands) { Brand.all }

  def index
  end
end
