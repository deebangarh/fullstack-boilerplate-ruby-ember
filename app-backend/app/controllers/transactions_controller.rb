class TransactionsController < ApplicationController

  def index
    @transactions = Transaction.order(created_at: :desc)
    # render json: { transactions: @transactions }
  end

  def show
    @transaction = Transaction.find(params[:id])
  end

  def new
    @transaction = Transaction.new
   end

   private
    # Use callbacks to share common setup or constraints between actions.
    def set_transaction
      @transaction = Transaction.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def transaction_params
      params.require(:transaction).permit(:amount, :account_id)
    end
end
