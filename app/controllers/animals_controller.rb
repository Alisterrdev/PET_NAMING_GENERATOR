class AnimalsController < ApplicationController


    def new
    @animal = Animal.new
  end

  def create
    @animal = Animal.new(animal_params)
    if @animal.save
      redirect_to animal_path(@animal)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @animal = Animal.find(animal_params)
  end

  private

  def animal_params
    params.require(:animal).permit(:id)
  end
end
