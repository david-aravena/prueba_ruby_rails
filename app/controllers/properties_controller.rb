class PropertiesController < ApplicationController
  def index
    @properties = Property.where(user_id: current_user.id)
  end

  def new
    @property = Property.new
  end

  def create
    @property = Property.new(property_params)
    @property.user_id = current_user.id
    if @property.save
      flash[:notice] = 'Product added!'   
      redirect_to root_path   
    else
      flash[:error] = 'Failed to edit product!'   
      render :new
    end
  end

  def edit
    @property = Property.find(params[:id])
  end

  def update
    @property = Property.find(params[:id])
    @property.update(property_params)
    redirect_to root_path 
  end

  def destroy
    @property = Property.find(params[:id])
    @property.destroy
    redirect_to root_path
  end

  private

  def property_params
    params.require(:property).permit(:price, :address, :area, :rooms, :toilets, :photo, :user_id)
  end
end
