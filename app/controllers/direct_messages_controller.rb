class DirectMessagesController < ApplicationController
  before_action :set_direct_message, only: [:show, :update, :destroy]

  # GET /direct_messages
  def index
    @send_messages = DirectMessage.find_by(sender_id: params[id])
    @recieved_messages = DirectMessage.find_by(reciever_id: params[id])
    render json: {send: @send_messages, recieve: @recieved_messages}
  end

  # GET /direct_messages/1
  def show
    render json: @direct_message
  end

  # POST /direct_messages
  def create
    @direct_message = DirectMessage.new(direct_message_params)

    if @direct_message.save
      render json: @direct_message, status: :created, location: @direct_message
    else
      render json: @direct_message.errors, status: :unprocessable_entity
    end
  end

  # DELETE /direct_messages/1
  def destroy
    @direct_message.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_direct_message
      @direct_message = DirectMessage.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def direct_message_params
      params.require(:direct_message).permit(:sender_id, :reciever_id, :message)
    end
end
