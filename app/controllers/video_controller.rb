class VideosController < ApplicationController
  def create
    video = Video.new(video_params)
    message = Message.new(sender_id: params[:sender_id], recipient_id: params[:recipient_id], messageable_type: 'Video', messageable_id: video.id)

    if message.save
      render json: message.to_json, status: 200
    else
      render json: { errors: message.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def video_params
    params.require(:message).permit(:sender_id, :recipient_id, :source, :length, :link)
  end
end
