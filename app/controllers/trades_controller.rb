class TradesController < ApplicationController
  before_action :set_trade, only: [:show, :edit, :update, :destroy, :add_card, :add_payment]

  # Add a card to the trade.
  def add_card
    number = params[:mine] ? -1 : 1
    @trade.add_card(params[:printing_id], number)

    @trade = @trade.decorate
    respond_to do |format|
      format.js {render 'refresh_card_list'}
    end
  end

  # Remove a card from the trade.
  def delete_card
    card = TradedCard.find(params[:id])
    card.destroy
    @trade = card.trade.decorate
    respond_to do |format|
      format.js {render 'refresh_card_list'}
    end
  end

  # Add a payment to the trade.
  def add_payment
    amount = params[:mine] ? -params[:amount].to_f : params[:amount].to_f
    @trade.add_payment(amount)
    @trade = @trade.decorate
    respond_to do |format|
      format.js {render 'refresh_card_list'}
    end
  end

  def delete_payment
    payment = Payment.find(params[:id])
    payment.destroy
    @trade = payment.trade.decorate
    respond_to do |format|
      format.js {render 'refresh_card_list'}
    end
  end

  # GET /trades
  # GET /trades.json
  def index
    @trades = Trade.all
  end

  # GET /trades/1
  # GET /trades/1.json
  def show
  end

  # GET /trades/new
  def new
    @trade = Trade.new
  end

  # GET /trades/1/edit
  def edit
    @trade = @trade.decorate
  end

  # POST /trades
  # POST /trades.json
  def create
    @trade = Trade.new(trade_params)

    respond_to do |format|
      if @trade.save
        format.html { redirect_to @trade, notice: 'Trade was successfully created.' }
        format.json { render action: 'show', status: :created, location: @trade }
      else
        format.html { render action: 'new' }
        format.json { render json: @trade.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trades/1
  # PATCH/PUT /trades/1.json
  def update
    respond_to do |format|
      if @trade.update(trade_params)
        format.html { redirect_to @trade, notice: 'Trade was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @trade.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trades/1
  # DELETE /trades/1.json
  def destroy
    @trade.destroy
    respond_to do |format|
      format.html { redirect_to trades_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trade
      @trade = Trade.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def trade_params
      params.require(:trade).permit(:user_id, :partner, :date)
    end
end
