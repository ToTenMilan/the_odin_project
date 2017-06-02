class KittensController < ApplicationController
  before_action :set_kitten, only: [:show, :edit, :update, :destroy]

  def index
    @kittens = Kitten.all
    respond_to do |format|
      format.html
      format.json { render json: @kittens }
    end
  end

  def show
    # @kitten = Kitten.find_by_id(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @kitten }
    end
  end

  def new
    @kitten = Kitten.new
  end

  def edit
    # @kitten = Kitten.find_by_id(params[:id])
  end

  def create
    @kitten = Kitten.new(kitten_params)

    if @kitten.save
      redirect_to @kitten
      flash[:notice] = "New kitten has been born"
    else
      flash.now[:warning] = "provide all kitten features"
      render 'new'
    end
  end

  def update
    # @kitten = Kitten.find_by_id(params[:id])

    if @kitten.update(kitten_params)
      redirect_to @kitten
      flash[:notice] = "Kitten updated"
    else
      flash.now[:warning] = "provide all data to update kitten"
      render 'edit'
    end
  end

  def destroy
    @kitten.destroy
    redirect_to kittens_url
  end

  private

    # pulled out from .show .edit .update
    def set_kitten
      @kitten = Kitten.find_by_id(params[:id])
    end

    def kitten_params
      params.require(:kitten).permit(:name, :age, :cuteness, :softness)
    end

end
