class AnimalsController < ApplicationController


    def new
    @animal = Animal.new
  end

  def create
    @animal = Animal.new(animal_params)
    @animal.user = current_user
    if @animal.save
      redirect_to animal_path(@animal)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @animal = Animal.find(params[:id])
    @animal.name = "Osiris"
    @animal.description = "Osiris est un dieu egyptien"
  end

  private

  def animal_params
    params.require(:animal).permit(:race, :species, :color, :origin, :sex)
  end
end
