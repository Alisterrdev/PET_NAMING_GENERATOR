class AnimalsController < ApplicationController

SYSTEM_PROMPT = 'Tu es un générateur de prénoms pour animaux et plus particulièrement pour chiens et chats.

Je suis le futur propriétaire d’un animal et je recherche un prénom qui répond à mes critères.

Aide moi à générer UN SEUL prénom pour mon futur animal.

Réponds moi avec le nom, UNIQUEMENT LE NOM.'

    def new
    @animal = Animal.new
  end

  def create
    @animal = Animal.new(animal_params)
    @animal.user = current_user
    if @animal.save
      @chat = RubyLLM.chat
      @response = @chat.ask(instructions)
      redirect_to animal_path(@animal)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @animal = Animal.find(params[:id])
    @chat = RubyLLM.chat
    @response = @chat.ask(instructions)
  end

  private

  def animal_params
    params.require(:animal).permit(:race, :species, :color, :origin, :sex)
  end

    private

  def animal_context
    "Je suis futur propriétaire d’un animal et je recherche un prénom et une description qui répond à ces 5 critères: #{@animal.species}, #{@animal.race}, #{@animal.color}, #{@animal.sex}, #{@animal.origin}."
  end

  def instructions
    [SYSTEM_PROMPT, animal_context].compact.join("\n\n")
  end

end
