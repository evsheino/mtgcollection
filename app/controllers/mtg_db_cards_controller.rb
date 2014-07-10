require 'mtgdb_api'

class MtgDbCardsController < ApplicationController

  before_action :set_mtg_db_card, only: [:show]

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
