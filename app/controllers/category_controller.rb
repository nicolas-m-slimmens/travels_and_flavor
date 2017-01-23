class CategoryController < ApplicationController
  before_action :find_category, only: [:edit, :update, :show, :destroy]

  load_and_authorize_resource

  def index
    @categories = Category.all
  end

  def show

  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.create(category_params)
    if @category.save(category_params)
      flash[:notice] = 'Categoria creada con exito'
      redirect_to category_path(@category)
    else
      flash[:alert] = 'Error al crear nueva categoria'
      render :new
    end
  end

  def edit

  end

  def update
    if @category.update_attributes(category_params)
      flash[:notice] = 'Categoria actualizada con exito'
      redirect_to category_path(@category)
    else
      flash[:alert] = 'Error al actualizar categoria'
      render :edit
    end
  end

  def destroy
    if @category.destroy
      flash[:notice] = 'Categoria eliminada con exito'
      redirect_to category_index_path
    else
      flash[:alert] = 'Error al eliminar categoria'
    end
  end

  private

  def find_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name, :description, :image, :category_id)
  end

end
