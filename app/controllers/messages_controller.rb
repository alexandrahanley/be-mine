class MessagesController < ApplicationController
    before_action :set_user_message, only: [:show, :edit, :update, :destroy]


    def index
      @messages = Message.all
    end


    def show
      @message= Message.new(message_params)
    end

    def new
      @user = User.find(params[:user_id])
      @message = Message.new
    end

    def edit
    end

    def create
      @message = Message.new(message_params)
      @message.user_id = params[:user_id]
      if @message.save
        redirect_to user_messages_path
      else
        render @user
      end
    end


    def message_params
      params.require(:message).permit(:description)
    end
  end
