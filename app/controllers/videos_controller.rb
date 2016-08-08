class VideosController < ApiBaseController
  def create
    validate_params([:link, :sender_id, :recipient_id], video_params) or return
    validate_users([video_params[:sender_id], video_params[:recipient_id]]) or return

    video = Video.create(link: video_params[:link],
                         source: video_params[:height],
                         length: video_params[:width])
    message = Message.new(sender_id: video_params[:sender_id], recipient_id: video_params[:recipient_id], messageable_type: 'Video', messageable_id: video.id)

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
