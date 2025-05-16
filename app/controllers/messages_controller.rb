class MessagesController < ApplicationController
    before_action :set_message , only: [ :edit, :update ]
    def index
        @messages=Message.all
    
    end

    def show
        @message=Message.find(params[:id])
        @user=@message.user
        @chat=@message.chat
    end

    def new
        @message = Message.new
    end
    def create
        @message = Message.new(message_params)
        if @message.save
          redirect_to @message, notice: "Message Created"
        else
          flash[:alert] = "#{@message.errors.full_messages.join(", ")}"
          redirect_to new_message_path
          
        end
    end
    def edit
        
    end

    def update
        
        
        if @message.update(message_params)
          redirect_to @message, notice: "Menssage Updated"
        else
          flash[:alert] = "#{@message.errors.full_messages.join(", ")}"
          redirect_to edit_message_path
        end
    end


    private
    def set_message
        @message=Message.find(params["id"])
    end
    def message_params
        params.require(:message).permit(:chat_id, :user_id, :body)
    end
end