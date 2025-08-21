class MessagesController < ApplicationController

  def new
    @message = Message.new
  end

  def create
    @message = Message.new
    if @message.save
      redirect_to animal_path(@animal)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def messages_params
    params.require(:message).permit(:content)
  end

end
