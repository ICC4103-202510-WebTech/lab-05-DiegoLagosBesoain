class ChatsController < ApplicationController
  load_and_authorize_resource
  before_action :set_chat, only: [ :edit, :update ]
  def index
        @chats = Chat.involving(current_user)
  end
  def show
        @chat = Chat.find(params[:id])
        @messages = @chat.messages.includes(:user)
  end
  def new
    @chat = Chat.new
  end
  
  def create
      @chat = Chat.new(chat_params)
      if @chat.save
          redirect_to chats_path, notice: "Chat Created"
      else
        flash[:alert] = "#{@chat.errors.full_messages.join(", ")}"
        redirect_to new_chat_path
      end
  end
  def edit
  end
  def update
  if @chat.update(chat_params)
      redirect_to chats_path, notice: "Chat Update!"
    else
      flash[:alert] = "#{@chat.errors.full_messages.join(", ")}"
      redirect_to edit_chat_path
    end
  end
      

      
    private

    def set_chat
      @chat=Chat.find(params["id"])
    end

    def get_asosiated_messages
    
    end
    def chat_params
      params.require(:chat).permit(:sender_id, :receiver_id)
    end
    
end