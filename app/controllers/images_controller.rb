class ImagesController < ApiBaseController
  def create
    validate_params([:link, :sender_id, :recipient_id], image_params) or return
    validate_users([image_params[:sender_id], image_params[:recipient_id]]) or return

    image = Image.create(link: image_params[:link],
                         height: image_params[:height],
                         width: image_params[:width])
    message = Message.new(sender_id: image_params[:sender_id], recipient_id: image_params[:recipient_id], messageable_type: 'Image', messageable_id: image.id)

    if message.save
      render json: message.to_json, status: 200
    else
      render json: { errors: message.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def image_params
    params.require(:message).permit(:sender_id, :recipient_id, :width, :height, :link)
  end
end
