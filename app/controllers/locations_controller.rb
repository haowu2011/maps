class LocationsController < ApplicationController

  def index
    @locations = Location.all
  end

  def show
    @location = Location.find_by(id: params[:id])
  end

  def new
  end

  def create
    @location = Location.new
    @location.name = params[:name]
    @location.address = params[:address]

    if @location.save
      redirect_to "/locations/#{ @location.id }"
    else
      render 'new'
    end
  end

  def edit
    @location = Location.find_by(id: params[:id])
  end

  def update
    @location = Location.find_by(id: params[:id])
    @location.name = params[:name]
    @location.address = params[:address]

    if @location.save
      redirect_to "/locations/#{ @location.id }"
    else
      render 'edit'
    end
  end

  def destroy
    @location = Location.find_by(id: params[:id])
    @location.destroy


    redirect_to "/locations"
  end
end
