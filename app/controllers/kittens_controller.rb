class KittensController < ApplicationController
  def index
    @kittens = Kitten.all
    respond_to do |format|
      format.html
      format.json { render json: @kittens }
    end
  end

  def show
    @kitten = Kitten.find(params[:id])
  end

  def new
    @kitten = Kitten.new
  end

  def create
    @kitten.new(kitten_params)
    if @kitten.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def destroy
    @kitten = Kitten.find(params[:id])
    @kitten.destroy
  end

  private

  def kitten_params
    require(:kitten).permit(:name, :age, :softness, :cuteness)
  end
end
