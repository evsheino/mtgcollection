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

  # Create a new record unless the same printing exists in the related trade, in which case update the
  # number of the existing record.
  def create_or_update
    p = traded_card_params_from_search_list_params

    @traded_card = TradedCard.increment_number_or_initialize(p)
    @trade = @traded_card.trade.decorate

    respond_to do |format|
      if @traded_card.save
        format.html { redirect_to @traded_card, notice: 'Traded card was successfully created.' }
        format.js { render 'trades/refresh_card_list' }
        format.json { render json: @traded_card, status: :created, location: @traded_card }
      else
        format.html { render action: 'new' }
        format.js { render 'trades/refresh_card_list' }
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
      params.require(:traded_card).permit(:trade_id, :printing_id, :foil, :signed, :altered, :number)
    end

    def traded_card_params_from_search_list_params
      p = {}
      if params[:mine]
        p[:number] = -params[:number].to_i
      else
        p[:number] = params[:number].to_i
      end
      p[:printing_id] = Printing.find_or_create_by_multiverse_id(params[:multiverse_id]).id
      p[:foil] = params[:foil] unless params[:foil].nil?
      p[:trade_id] = params[:trade_id].to_i
      p
    end

end
