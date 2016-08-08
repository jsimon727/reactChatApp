class ImagesController < ApplicationController
  def create
    image = Image.create(image_params)
    message = Message.new(sender_id: params[:sender_id], recipient_id: params[:recipient_id], messageable_type: 'Image', messageable_id: image.id)

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
