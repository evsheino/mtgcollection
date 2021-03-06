class LoansController < ApplicationController
  before_action :set_loan, only: [:show, :edit, :update, :destroy]

  # GET /loans
  # GET /loans.json
  def index
    @borrowings = Loan.where(borrower: current_user).decorate
    @loans = Loan.where(owner: current_user).decorate
  end

  # GET /loans/1
  # GET /loans/1.json
  def show
    @loan = @loan.decorate
  end

  # GET /loans/new
  def new
    @loan = Loan.new
  end

  # GET /loans/1/edit
  def edit
    @loan = @loan.decorate
    @users = User.all
  end

  # POST /loans
  # POST /loans.json
  def create
    @loan = Loan.new(loan_params)
    @users = User.all
    @cards = OwnedCard.where(user: current_user)

    respond_to do |format|
      if @loan.save
        format.html { redirect_to loans_path, notice: 'Loan was successfully created.' }
        format.json { render action: 'show', status: :created, location: @loan }
      else
        format.html { render action: 'new' }
        format.json { render json: @loan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /loans/1
  # PATCH/PUT /loans/1.json
  def update
    respond_to do |format|
      if @loan.update(loan_params)
        format.html { redirect_to loans_path, notice: 'Loan was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @loan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /loans/1
  # DELETE /loans/1.json
  def destroy
    @loan.destroy
    respond_to do |format|
      format.html { redirect_to loans_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_loan
      @loan = Loan.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def loan_params
      params.require(:loan).permit(:owner_id, :borrower_id, :owner_name, :borrower_name, 
                                   :printing_id, :number, :note)
    end
end
