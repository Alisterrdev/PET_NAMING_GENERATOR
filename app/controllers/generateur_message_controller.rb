class GenerateurMessageController < ApplicationController

SYSTEM_PROMPT = 'Tu es un générateur de prénoms pour animaux et plus particulièrement pour chiens et chats.
Je suis futur propriétaire d’animals et je recherche un prénom qui répond à mes critères.
J’ai besoin de trouver le meilleur prénom pour mon chien qui est de race labrador, qui est un mâle, de couleur noire. Au format .json'

def create
  @animal = Animals.find(params[:animals_id])
  @message = Message.new(role: "user", content: params[:message][:content], animal: @animal)
  if @message.save
    @chat = RubyLLM.chat
    response = @chat.with_instructions(SYSTEM_PROMPT).ask(@message.content)
    Message.create(role: "assistant", content: response.content, animal: @animal)
    redirect_to animal_messages_path(@animal)
    @chat.with_instructions(instructions)
  else
    render :new
  end

  private

  def animal_context
    "Je suis futur propriétaire d’animals et je recherche un prénom qui répond à mes critères: #{@animal.content}."
  end

  def instructions
    [SYSTEM_PROMPT, animal_context].compact.join("\n\n")
  end

end
