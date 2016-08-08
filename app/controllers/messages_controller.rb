class MessagesController < ApplicationController
  def new
    @message = Message.new
  end

  def show
    messages = Message.between(params[:recipient_ids].first, params[:recipient_ids].last)
    paginated_messages = messages.paginate(page: params[:page], per_page: params[:per_page])
    render json: paginated_messages.to_json, status: 200
  end

  def create
    text = Text.create(message_params)
    message = Message.new(sender_id: params[:sender_id], recipient_id: params[:recipient_id], messageable_type: 'Text', messageable_id: text.id)

    if message.save
      render json: message.to_json, status: 200
    else
      render json: { errors: message.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def message_params
    params.require(:message).permit(:sender_id, :recipient_id, :body)
  end
end
