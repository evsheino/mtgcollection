class PrintingsController < ApplicationController
  before_action :set_printing, only: [:show, :edit, :update, :destroy]

  # GET /printings
  # GET /printings.json
  def index
    @printings = Printing.joins(:card).order("cards.name").paginate(page: params[:page])
  end

  # GET /printings/1
  # GET /printings/1.json
  def show
  end

  # GET /printings/new
  def new
    @printing = Printing.new
    @cards = Card.all
    @expansions = Expansion.all
  end

  # GET /printings/1/edit
  def edit
    @cards = Card.all
    @expansions = Expansion.all
  end

  # POST /printings
  # POST /printings.json
  def create
    @printing = Printing.new(printing_params)

    respond_to do |format|
      if @printing.save
        format.html { redirect_to @printing, notice: 'Expansion card was successfully created.' }
        format.json { render action: 'show', status: :created, location: @printing }
      else
        format.html { render action: 'new' }
        format.json { render json: @printing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /printings/1
  # PATCH/PUT /printings/1.json
  def update
    respond_to do |format|
      if @printing.update(printing_params)
        format.html { redirect_to @printing, notice: 'Expansion card was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @printing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /printings/1
  # DELETE /printings/1.json
  def destroy
    @printing.destroy
    respond_to do |format|
      format.html { redirect_to printings_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_printing
      @printing = Printing.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def printing_params
      params.require(:printing).permit(:card_id, :expansion_id)
    end
end
