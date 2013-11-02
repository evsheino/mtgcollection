class TradedCardsController < ApplicationController
  before_action :set_traded_card, only: [:show, :edit, :update, :destroy]

  # GET /traded_cards
  # GET /traded_cards.json
  def index
    @traded_cards = TradedCard.all
  end

  # GET /traded_cards/1
  # GET /traded_cards/1.json
  def show
  end

  # GET /traded_cards/new
  def new
    @traded_card = TradedCard.new
  end

  # GET /traded_cards/1/edit
  def edit
  end

  # POST /traded_cards
  # POST /traded_cards.json
  def create
    @traded_card = TradedCard.new(traded_card_params)

    respond_to do |format|
      if @traded_card.save
        format.html { redirect_to @traded_card, notice: 'Traded card was successfully created.' }
        format.js {}
        format.json { render json: @traded_card, status: :created, location: @traded_card }
      else
        format.html { render action: 'new' }
        format.json { render json: @traded_card.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /traded_cards/1
  # PATCH/PUT /traded_cards/1.json
  def update
    respond_to do |format|
      if @traded_card.update(traded_card_params)
        format.html { redirect_to @traded_card, notice: 'Traded card was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @traded_card.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /traded_cards/1
  # DELETE /traded_cards/1.json
  def destroy
    @traded_card.destroy
    @trade = @traded_card.trade.decorate
    respond_to do |format|
      format.js { render 'trades/refresh_card_list' }
      format.html { redirect_to traded_cards_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_traded_card
      @traded_card = TradedCard.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def traded_card_params
      params.require(:traded_card).permit(:trade_id, :printing_id, :foil, :number)
    end
end
