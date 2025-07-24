class MessagesController < ApplicationController
  # def new
  #   @message = message.new
  # end

  def create
    @room = Room.find(params[:room_id])
    @message = @room.messages.new(message_params)

    respond_to do |format|
      if @message.save
        format.turbo_stream
        format.html { redirect_to @room, notice: "Comment posted" }
      else
        format.html { render @room, status: :unprocessable_entity }
      end
    end
  end

  private

  def message_params
    params.expect(message: [ :user_id, :content ])
  end
end
