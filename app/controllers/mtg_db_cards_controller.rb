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
      OwnedCard.add_or_update_from_mtg_db_card(@card, current_user.id, 1, 
                                               params[:foil] == 1 ? true : false)
      @card = MtgDbCardDecorator.decorate(@card)
      format.js { render 'mtg_db_cards/update_owned' }
    end
  end
  
  def deduct_from_collection
    respond_to do |format|
      OwnedCard.add_or_update_from_mtg_db_card(@card, current_user, -1, 
                                               params[:foil] == 1 ? true : false)
      @card = MtgDbCardDecorator.decorate(@card)
      format.js { render 'mtg_db_cards/update_owned' }
    end
  end

  def borrow
    card = MtgDbCard.find(params[:card_id])
    printing = Printing.find_or_create_from_mtg_db_card(card)
    owner_name = params[:owner]
    owner = User.find_by(username: owner_name)
    if owner.nil?
      loan = Loan.find_or_initialize_by(owner_name: owner_name,
                                        borrower_id: current_user.id,
                                        printing_id: printing.id)
    else
      loan = Loan.find_or_initialize_by(owner_id: owner.id,
                                        borrower_id: current_user.id,
                                        printing_id: printing.id)
    end

    if loan.number.nil? then loan.number = 0 end
    loan.number += params[:number].to_i
    loan.note = params[:note]
    loan.save

    respond_to do |format|
      @card = MtgDbCardDecorator.decorate(card)
      @loan = loan
      format.js { render 'mtg_db_cards/update_owned' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mtg_db_card
      @card = MtgDbCard.find(params[:id])
    end

end
