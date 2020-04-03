class LikesController < ApplicationController
  before_action :set_like, only: [:show, :update, :destroy]
  before_action :authenticate_user

  # POST /likes
  def create
    @like = Like.new(like_params)

    if @like.save
      render json: @like, status: :created, location: @like
    else
      render json: @like.errors, status: :unprocessable_entity
    end
  end

  # DELETE /likes/1
  def destroy
    @like.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_like
      @like = Like.new(user_id: @current_user.id, tweet_id: params[:tweet_id])
    end

    # Only allow a trusted parameter "white list" through.
    def like_params
      params.require(:like).permit(:user_id, :tweet_id)
    end
end
