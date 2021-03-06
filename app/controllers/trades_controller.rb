class TradesController < ApplicationController
  before_action :set_trade, only: [:show, :edit, :update, :destroy, :add_payment,
                                   :edit_details, :execute, :list_cards]

  # Add a payment to the trade.
  def add_payment
    amount = params[:mine] ? -params[:amount].to_f : params[:amount].to_f
    @trade.add_payment(amount)
    @trade = @trade.decorate
    respond_to do |format|
      format.js {render 'refresh_card_list'}
    end
  end

  def list_cards
    respond_to do |format|
      format.js {
        @cards = MtgDbCardDecorator.decorate_collection(
          MtgDbCard.search(params[:name], params[:expansion]).paginate(page: params[:page])
        )
        render 'refresh_search_list'
      }
      format.json {
        render json: MtgDbCard.search(params[:name], params[:expansion])
      }
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
    @trade = @trade.decorate
  end

  # GET /trades/new
  def new
    @trade = Trade.new(user: current_user)
  end

  # GET /trades/1/edit
  def edit
    @trade = @trade.decorate
    @new_card = TradedCard.new
  end

  def edit_details
    @trade = @trade.decorate
  end

  def execute
    respond_to do |format|
      if @trade.execute
        format.html { redirect_to edit_trade_path(@trade), notice: 'Trade was successfully executed.' }
      else
        format.html { redirect_to edit_trade_path(@trade), alert: 'Could not execute trade' }
      end
    end
  end

  # POST /trades
  # POST /trades.json
  def create
    @trade = Trade.new(trade_params)

    respond_to do |format|
      if @trade.save
        format.html { redirect_to edit_trade_path(@trade), notice: 'Trade was successfully created.' }
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
