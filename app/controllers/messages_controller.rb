class MessagesController < ApiBaseController
  def index
    validate_params([:participant_ids], message_params) or return
    validate_users(message_params[:participant_ids]) or return

    messages = Message.between(message_params[:participant_ids].first, message_params[:participant_ids].last)

    if messages.present?
      paginated_messages = messages.paginate(page: params[:page], per_page: params[:per_page])
      render json: paginated_messages.to_json, status: 200
    else
      render json: { errors: "No messages exist between the participants specified" }, status: :unprocessable_entity
    end
  end

  def create
    validate_params([:body, :sender_id, :recipient_id], message_params) or return
    validate_users([message_params[:sender_id], message_params[:recipient_id]]) or return

    text = Text.create(body: message_params[:body])
    message = Message.new(sender_id: message_params[:sender_id], recipient_id: message_params[:recipient_id], messageable_type: 'Text', messageable_id: text.id)

    if message.save
      render json: message.to_json, status: 200
    else
      render json: { errors: message.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def message_params
    params.require(:message).permit(:sender_id, :recipient_id, :body, participant_ids: [])
  end
end
