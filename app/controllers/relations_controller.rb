class RelationsController < ApplicationController
  before_action :set_follow
  before_action :set_follower
  before_action :authenticate_user


  # GET /relations/1
  def follow_list
    render json: @follow
  end

  def follower_list
    render json: @follower
  end

  # POST /relations
  def create
    @relation = Relation.new(relation_params)

    if @relation.save
      render json: @relation, status: :created, location: @relation
    else
      render json: @relation.errors, status: :unprocessable_entity
    end
  end


  # DELETE /relations/1
  def destroy
    @relation.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_follow
      @follow = Relation.find_by(follow_id; params[:id])
    end

    def set_follower
      @follower = Relation.find_by(follower_id: params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def relation_params
      params.require(:relation).permit(:follow_id, :follower_id)
    end
end
