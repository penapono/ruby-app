class ModelsController < ApplicationController
  expose (:brand) { Brand.find_by(webmotors_id: params[:brand_id]) }
  expose (:models) { brand.models }

  def index
  end
end
