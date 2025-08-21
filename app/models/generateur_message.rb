class GenerateurMessage < ApplicationRecord
  belongs_to :animals
  def new
    @animals = Animals.find(params[:animals_id])
    @message = Message.new
  end
end
