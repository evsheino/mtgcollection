class ExpansionCardsController < ApplicationController
  before_action :set_expansion_card, only: [:show, :edit, :update, :destroy]

  # GET /expansion_cards
  # GET /expansion_cards.json
  def index
    @expansion_cards = ExpansionCard.all
  end

  # GET /expansion_cards/1
  # GET /expansion_cards/1.json
  def show
  end

  # GET /expansion_cards/new
  def new
    @expansion_card = ExpansionCard.new
    @cards = Card.all
    @expansions = Expansion.all
  end

  # GET /expansion_cards/1/edit
  def edit
    @cards = Card.all
    @expansions = Expansion.all
  end

  # POST /expansion_cards
  # POST /expansion_cards.json
  def create
    @expansion_card = ExpansionCard.new(expansion_card_params)

    respond_to do |format|
      if @expansion_card.save
        format.html { redirect_to @expansion_card, notice: 'Expansion card was successfully created.' }
        format.json { render action: 'show', status: :created, location: @expansion_card }
      else
        format.html { render action: 'new' }
        format.json { render json: @expansion_card.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /expansion_cards/1
  # PATCH/PUT /expansion_cards/1.json
  def update
    respond_to do |format|
      if @expansion_card.update(expansion_card_params)
        format.html { redirect_to @expansion_card, notice: 'Expansion card was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @expansion_card.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /expansion_cards/1
  # DELETE /expansion_cards/1.json
  def destroy
    @expansion_card.destroy
    respond_to do |format|
      format.html { redirect_to expansion_cards_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_expansion_card
      @expansion_card = ExpansionCard.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def expansion_card_params
      params.require(:expansion_card).permit(:card_id, :expansion_id)
    end
end
