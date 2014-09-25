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
      flash[:notice] = 'The den has been created.'
      respond_to do |format|
        format.html { redirect_to den_path(@den) }
        format.js
      end
    else
      render 'new'
    end
  end

  def show
    @den = Den.find(params[:id])
    @review = Review.new
    @user = User.find_by(@review.user_id)
  end

  def edit
    @den = Den.find(params[:id])
  end

  def update
    @den = Den.find(params[:id])
    if @den.update(den_params)
      respond_to do |format|
        format.html { redirect_to den_path(@den) }
        format.js
      end
      flash[:notice] = 'The den has been updated.'
    else
      render 'edit'
    end
  end

  def destroy
    @den = Den.find(params[:id])
    @den.destroy
    flash[:notice] =  "The den has been deleted."
    respond_to do |format|
      format.html { redirect_to root_url }
      format.js
    end
  end


private
  def den_params
    params.require(:den).permit(:name, :description).merge(user_id: current_user.id)
  end
end
