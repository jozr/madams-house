class DensController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]

  def index
    @dens = Den.all
  end

  def new
    @den = Den.new
  end

  def create
    @den = Den.new(den_params)
    if @den.save
      redirect_to root_url, notice: 'The den has been created.'
    else
      render 'new'
    end
  end

  def show
    @den = Den.find(params[:id])
  end

  def edit
    @den = Den.find(params[:id])
  end

  def update
    @den = Den.find(params[:id])
    if @den.update
      redirect_to den_path(@den), notice: 'The den has been updated.'
    else
      render 'edit'
    end
  end

  def destroy
    @den = Den.find(params[:id])
    @den.destroy
    flash[:notice] =  "The den has been deleted."
    redirect_to root_url
  end


private
  def den_params
    params.require(:den).permit(:name, :description).merge(user_id: current_user.id)
  end
end
