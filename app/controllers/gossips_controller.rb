class GossipsController < ApplicationController
  before_action :set_gossip, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  
  def authenticate_user!
    redirect_to new_session_path, alert: "Vous devez vous connecter pour accéder à cette page." unless user_signed_in?
  end

  def index
    @gossips = Gossip.all
  end

  def show
  end

  def new
    @gossip = Gossip.new
  end

  def create
    @gossip = Gossip.new(gossip_params)

    if @gossip.save
      redirect_to @gossip, notice: 'Gossip was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @gossip.update(gossip_params)
      redirect_to @gossip, notice: 'Gossip was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @gossip.destroy
    redirect_to gossips_url, notice: 'Gossip was successfully destroyed.'
  end

  private

  def set_gossip
    @gossip = Gossip.find(params[:id])
  end

  def gossip_params
    params.require(:gossip).permit(:content, :user_id)
  end
end