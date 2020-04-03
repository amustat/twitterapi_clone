class TweetsController < ApplicationController
  before_action :set_tweet, only: [:show, :update, :destroy]
  before_action :ensure_correct_user, {only: [:edit, :update, :destroy]}

  # GET /tweets
  def index
    @tweets = Tweet.all.order(created_at: :desc)
    render json: @tweets
  end

  # GET /tweets/1
  def show
    @user = @tweet.user
    @likes_count = Like.where(post_id: @post.id).count
    render json: {tweeet: @tweet, user: @user, likes_count: @likes_count}
  end

  # POST /tweets
  def create
    @tweet = Tweet.new(tweet_params)

    if @tweet.save
      render json: @tweet, status: :created, location: @tweet
    else
      render json: @tweet.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tweets/1
  def update
    if @tweet.update(tweet_params)
      render json: @tweet
    else
      render json: @tweet.errors, status: :unprocessable_entity
    end
  end

  # DELETE /tweets/1
  def destroy
    @tweet.destroy
  end

  def ensure_correct_user
    if @tweet.user_id != @current_user.id
      render json: @user.errors, status: :unauthorized
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tweet
      @tweet = Tweet.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def tweet_params
      params.require(:tweet).permit(:tweet, :user_id)
    end
end
