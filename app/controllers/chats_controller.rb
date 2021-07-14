class ChatsController < ApplicationController
  def new
    @pet = Pet.find(params[:id])
    @chats = Chat.all
  end
  def create
    @chat = Chat.create(pet_id: params[:id], user_id: current_user.id, comment: params[:comment])
    if @chat.valid?
      @chat.save
      redirect_to :back
    else
      flash[:errors] = ["Try again, something isn't correct. There must be at least 2 characters."]
      redirect_to :back
    end
  end
end
