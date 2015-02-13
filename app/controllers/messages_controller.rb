class MessagesController < ApplicationController


    def index
      @messages = Message.all
    end


    def show
      @message = Message.find(params[:id])
    end

    # GET /tasks/new
    def new
      @message = Message.new
    end

    def edit
      @message = Message.find(params[:id])

    end


    def create
      @message = Message.new(message_params)
      if @message.save
        redirect_to @message, notice: 'Project was successfully created.'
      else
        render :new
      end
    end


    def update
      @message = Message.find(params[:id])
      if @message.update(message_params)
        redirect_to @message
      else
        render :edit
      end
    end

    def destroy
      @message = Message.find(params[:id])
      @message.destroy
      redirect_to @message
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @message= Message.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def message_params
      params.require(:message).permit(:description)
    end
  end
