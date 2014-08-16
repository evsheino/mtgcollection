class OwnedCardsController < ApplicationController
  before_action :set_owned_card, only: [:show, :edit, :update, :destroy]

  # GET /owned_cards
  # GET /owned_cards.json
  def index
    if params[:name] || params[:expansion]
      owned_cards = OwnedCard.search(params[:name], params[:expansion], current_user.id)
    else
      owned_cards = OwnedCard.where(user_id: current_user.id)
    end
    @owned_cards = owned_cards.includes(:printing, :loans, :user, :card, :expansion)
        .paginate(page: params[:page]).decorate
  end

  # GET /owned_cards/1
  # GET /owned_cards/1.json
  def show
  end

  # GET /owned_cards/new
  def new
    @owned_card = OwnedCard.new
    @cards = Printing.where(card_id: params[:card_id])
  end

  # GET /owned_cards/1/edit
  def edit
    @cards = @owned_card.printing.card.printings
  end

  # POST /owned_cards
  # POST /owned_cards.json
  def create
    @owned_card = OwnedCard.new(owned_card_params)
    @owned_card.user = current_user

    respond_to do |format|
      if @owned_card.save
        format.html { redirect_to @owned_card, notice: 'Owned card was successfully created.' }
        format.json { render action: 'show', status: :created, location: @owned_card }
      else
        @cards = @owned_card.printing.card.printings
        format.html { render action: 'new' }
        format.json { render json: @owned_card.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /owned_cards/1
  # PATCH/PUT /owned_cards/1.json
  def update
    respond_to do |format|
      if @owned_card.user == current_user && @owned_card.update(owned_card_params)
        format.html { redirect_to @owned_card, notice: 'Owned card was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @owned_card.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /owned_cards/1
  # DELETE /owned_cards/1.json
  def destroy
    if @owned_card.user == current_user
      @owned_card.destroy
    end

    respond_to do |format|
      format.html { redirect_to owned_cards_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_owned_card
      @owned_card = OwnedCard.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def owned_card_params
      params.require(:owned_card).permit(:printing_id, :user_id, :number)
    end
end
