class ToiletsController < ApplicationController

  def index
    if params[:lat] && params[:lng]
      @current_location = Location.new(lat: params[:lat], lng: params[:lng])
      @toilets = Toilet.close_to(@current_location).paginate(page: params[:page])
    else
      @toilets = []
    end

    @toilet = Toilet.new()
    @toilet_type_options = ['portapotty', 'public bathroom', 'outhouse', 'store']

    respond_to do |format|
      format.html
      format.js
    end
  end

  def show
    @toilet = Toilet.find(params[:id])
  end
end
