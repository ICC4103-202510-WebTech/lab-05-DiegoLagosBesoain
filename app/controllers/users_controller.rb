class UsersController < ApplicationController
    before_action :set_user, only: [ :edit, :update ]
    def index
        @users=User.all
    
    end

    def show
        @user=User.find(params[:id])
        @sent_chats=@user.sent_chats
        @received_chats = @user.received_chats
    end

    def new
        @user = User.new
        
    end
    
    def create
        @user = User.new(user_params)
        if @user.save
          redirect_to users_path, notice: 'Usuario creado correctamente.'
        else
          flash[:alert] = "#{@user.errors.full_messages.join(", ")}"
          redirect_to new_user_path
        end
    end
    def edit
    end
    
    def update
        
        if @user.update(user_params)
          redirect_to users_path, notice: 'Usuario creado correctamente.'
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