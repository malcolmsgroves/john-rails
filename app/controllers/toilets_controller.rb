require 'will_paginate/array'

class ToiletsController < ApplicationController

  WillPaginate.per_page = 15

  def new
    @toilet = Toilet.new()
    @type_options = ['portapotty', 'public bathroom', 'outhouse', 'store']
    @location = @toilet.build_location
    respond_to do |format|
      format.js
      format.html { render partial: "toilet_form", locals: { toilet: @toilet, type_options: @type_options }  }
    end
  end

  def cancel_new
    respond_to do |format|
      format.js
      format.html { redirect_to root_path }
    end
  end

  def index
    if params[:lat] && params[:lng]
      @current_location = Location.new(lat: params[:lat], lng: params[:lng])
      @toilets = Toilet.close_to(@current_location).paginate(page: params[:page])

      puts params[:page]
      puts
      puts "HERE"
    else
      @toilets = []
    end

    @review = Review.new()
    @rating_options = [["5 - Ritzy", 5], ["4 - Mom cleaned", 4], ["3 - Servicable", 3], ["2 - Rather use the woods", 2], ["1 - Unspeakable", 1]]

    respond_to do |format|
      format.html
      format.js
    end
  end



  def create
    @toilet = Toilet.new(toilet_params)
    @current_location = @toilet.location
    if @toilet.save
      respond_to do |format|
        format.js
        format.html { redirect_to root_path }
      end
    else
      puts @toilet.errors.full_messages
      redirect_to root_path

    end
  end

  private
    def toilet_params
      params.require(:toilet).permit(:name, :toilet_type, :description,
                                     :location_attributes => [:lat, :lng])
    end
end
