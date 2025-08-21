class GenerateurMessageController < ApplicationController

SYSTEM_PROMPT = 'Tu es un générateur de prénoms pour animaux et plus particulièrement pour chiens et chats.

Je suis le futur propriétaire d’un animal et je recherche un prénom qui répond à mes critères.

Aide moi à générer UN SEUL prénom pour mon futur animal et décris moi ton choix dans un paragraphe distinct.

Réponds moi avec deux markdowns, le premier étant uniquement le nom généré, le deuxième étant la description. Au format .json'

def create
  @animal = Animals.find(params[:animals_id])
  @message = Message.new(role: "user", content: params[:message][:content], animal: @animal)
  if @message.save

    Message.create(role: "assistant", content: response.content, animal: @animal)
    redirect_to animal_messages_path(@animal)
    @chat.with_instructions(instructions)
  else
    render :new
  end
end

  private

  def animal_context
    "Je suis futur propriétaire d’un animal et je recherche un prénom et une description qui répond à ces 5 critères: #{@animal.species}, #{@animal.race}, #{@animal.color}, #{@animal.sex}, #{@animal.origin}."
  end

  def instructions
    [SYSTEM_PROMPT, animal_context].compact.join("\n\n")
  end

end
