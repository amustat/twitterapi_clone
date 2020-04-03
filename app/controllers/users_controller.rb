class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]
  before_action :authenticate_user, {only: [:index, :show, :edit, :update]}

  # GET /users
  def index
    @users = User.all

    render json: @users
  end

  # GET /users/1
  def show
    @tweets = @user.tweets
    render json: {user: @user, tweets: @tweets}
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:name, :email, :password_digest)
    end

    def login
      if @user && @user.authenticate(params[:password])
        session[:user_id] = @user.id
        render json: @user, status: :ok, location: @user
      else
        render json: @user.errors, status: :unauthorized
      end
    end

    def logout
      session[:user_id] = nil
      render json: @user, status: :ok
    end

    def likes
      @likes = Like.where(user_id: @user.id)
    end

    def ensure_correct_user
      if @current_user.id != params[:id].to_i
        render json: @user.errors, status: :unauthorized
      end
    end


end
