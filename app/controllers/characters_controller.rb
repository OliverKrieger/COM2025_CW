class CharactersController < ApplicationController
  before_action :set_character, only: %i[ show edit update destroy ]
  before_action :set_campaign, only: [:new, :create]

  # GET /characters or /characters.json
  def index
    # @characters = Character.all
    redirect_to campaigns_url
  end

  # GET /characters/1 or /characters/1.json
  def show
  end

  # GET /characters/new
  def new
    @character = @campaign.characters.new
  end

  # GET /characters/1/edit
  def edit
  end

  # POST /characters or /characters.json
  def create
    @character = @campaign.characters.new(character_params)

    respond_to do |format|
      if @character.save
        format.html { redirect_to @character, notice: t(".char_create_msg") }
        format.json { render :show, status: :created, location: @character }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @character.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /characters/1 or /characters/1.json
  def update
    respond_to do |format|
      if @character.update(character_params)
        format.html { redirect_to @character, notice: t(".char_update_msg") }
        format.json { render :show, status: :ok, location: @character }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @character.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /characters/1 or /characters/1.json
  def destroy
    @character.destroy
    respond_to do |format|
      format.html { redirect_to campaigns_url, notice: t(".char_destroy_msg") }
      format.js { flash[:notice] = t(".char_destroy_msg")}
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_character
      @character = Character.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def character_params
      params.require(:character).permit(:campaign_id, :name, :desc, :image)
    end

    def set_campaign
      @campaign = Campaign.find_by(id: params[:campaign_id]) || Campaign.find(character_params[:campaign_id])
    end
end
