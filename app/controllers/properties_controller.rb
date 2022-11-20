class PropertiesController < ApplicationController
  before_action :find_property, only: [:edit, :update, :destroy]

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
    @property = Property.createProperty(property_params, current_user.id)
    if @property.save
      flash[:notice] = '  Propiedad creada!'   
      redirect_to root_path   
    else
      flash[:error] = 'Error al intentar crear la propiedad!'   
      render :new
    end
  end

  def edit
  end

  def update
    if @property.update(property_params)
      flash[:notice] = '  Propiedad editada!' 
      redirect_to root_path
    else
      flash[:error] = 'Error al intentar editar la propiedad!'   
      render :edit
    end
  end

  def destroy
    if @property.destroy
      flash[:notice] = '  Propiedad eliminada!' 
      redirect_to root_path
    else
      flash[:error] = 'Error al intentar eliminar la propiedad!'   
      render :index
    end
  end

  private

  def find_property
    @property = Property.find(params[:id])
  end

  def property_params
    params.require(:property).permit(:price, :address, :area, :rooms, :toilets, :photo, :user_id)
  end
end
