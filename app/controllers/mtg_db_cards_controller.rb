require 'mtgdb_api'

class MtgDbCardsController < ApplicationController

  before_action :set_mtg_db_card, only: [:show, :edit, :update, :destroy]

  # GET /mtg_db_cards
  # GET /mtg_db_cards.json
  def index

    respond_to do |format|
      format.html {@cards = MtgDbCard.search(params[:name], params[:expansion]).paginate(page: params[:page])}
      format.json {
        render json: MtgDbCard.search(params[:name], params[:expansion]).includes(:card, :expansion),
               methods: [:card, :expansion]
      }
    end
  end

  # GET /mtg_db_cards/1
  # GET /mtg_db_cards/1.json
  def show
  end

  # GET /mtg_db_cards/new
  def new
    @mtg_db_card = MtgDbCard.new
  end

  # GET /mtg_db_cards/1/edit
  def edit
  end

  # POST /mtg_db_cards
  # POST /mtg_db_cards.json
  def create
    @mtg_db_card = MtgDbCard.new(mtg_db_card_params)

    respond_to do |format|
      if @mtg_db_card.save
        format.html { redirect_to @mtg_db_card, notice: 'Mtg db card was successfully created.' }
        format.json { render action: 'show', status: :created, location: @mtg_db_card }
      else
        format.html { render action: 'new' }
        format.json { render json: @mtg_db_card.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mtg_db_cards/1
  # PATCH/PUT /mtg_db_cards/1.json
  def update
    respond_to do |format|
      if @mtg_db_card.update(mtg_db_card_params)
        format.html { redirect_to @mtg_db_card, notice: 'Mtg db card was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @mtg_db_card.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mtg_db_cards/1
  # DELETE /mtg_db_cards/1.json
  def destroy
    @mtg_db_card.destroy
    respond_to do |format|
      format.html { redirect_to mtg_db_cards_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mtg_db_card
      @card = MtgDbCard.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mtg_db_card_params
      params[:mtg_db_card]
    end
end
