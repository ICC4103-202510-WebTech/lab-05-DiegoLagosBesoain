class UsersController < ApplicationController
    load_and_authorize_resource
    before_action :set_user, only: [ :edit, :update ]
    def index
        @users=User.all
    
    end

    def show
    @user = User.find(params[:id])

    
    @chats = Chat.where("sender_id = :id OR receiver_id = :id", id: @user.id)

    
    @messages = Message.where(user_id: @user.id)
    end
    def new
      redirect_to new_user_registration_path
    end
    
    def create
        @user = User.new(user_params)
        if @user.save
          redirect_to users_path, notice: 'User Created'
        else
          flash[:alert] = "#{@user.errors.full_messages.join(", ")}"
          redirect_to new_user_path
        end
    end
    def edit
    end
    
    def update
        
        if @user.update(user_params)
          redirect_to users_path, notice: 'User Updated'
        else
          flash[:alert] = "#{@user.errors.full_messages.join(", ")}"
          redirect_to edit_user_path
        end
    end
    

    
    private
    def set_user
      @user = User.find params["id"]
    end
    def user_params
        params.require(:user).permit(:first_name, :email, :last_name) 
    end
    def received_chats
    end
    def sender_chats
    end
end