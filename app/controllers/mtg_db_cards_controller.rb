require 'mtgdb_api'

class MtgDbCardsController < ApplicationController

  before_action :set_mtg_db_card, only: [:show, :add_to_collection, :deduct_from_collection]

  # GET /mtg_db_cards
  # GET /mtg_db_cards.json
  def index
    respond_to do |format|
      format.html {
        @cards = MtgDbCardDecorator.decorate_collection(
          MtgDbCard.search(params[:name], params[:expansion]).paginate(page: params[:page])
        )
        @users = User.all
      }
      format.json {
        render json: MtgDbCard.search(params[:name], params[:expansion])
      }
    end
  end

  # GET /mtg_db_cards/1
  # GET /mtg_db_cards/1.json
  def show
  end

  def add_to_collection
    respond_to do |format|
      OwnedCard.add_or_update_from_mtg_db_card(@card, current_user, 1)
      @card = MtgDbCardDecorator.decorate(@card)
      format.js { render 'mtg_db_cards/update_owned' }
    end
  end
  
  def deduct_from_collection
    respond_to do |format|
      OwnedCard.add_or_update_from_mtg_db_card(@card, current_user, -1)
      @card = MtgDbCardDecorator.decorate(@card)
      format.js { render 'mtg_db_cards/update_owned' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mtg_db_card
      @card = MtgDbCard.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mtg_db_card_params
      params[:mtg_db_card, :number]
    end
end
