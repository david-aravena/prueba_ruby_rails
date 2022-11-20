class PropertiesController < ApplicationController
  def index
    @properties = Property.userProperties(current_user.id)

    if params[:number_toilets]
      @properties = Property.searchToiletsNumber(params[:number_toilets], current_user.id)
    end

    if params[:number_rooms]
      @properties = Property.searchRoomsNumber(params[:number_rooms], current_user.id)
    end

    if params[:address]
      @properties = Property.searchAddress(params[:address], current_user.id)
    end

    @properties = @properties.paginate(page: params[:page], per_page: 2)
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
