class TransactionsController < ApplicationController


  def index
    @transactions = Transaction.includes(:account).order(created_at: :desc)
    render json: @transactions, include: { account: { only: [:accountid, :balance] } }
  end

  def show
    render json: @transaction, include: { account: { only: [:accountid, :balance] } }
  end

  def new
    @transaction = Transaction.new
  end

  def create
    @transaction = Transaction.new(transaction_params)

    if @transaction.save
      current_balance = current_account_balance
      render json: { transaction: @transaction, current_account_balance: current_balance }, status: :created
    else
      render json: @transaction.errors, status: :unprocessable_entity
    end
  end

  private


  def transaction_params
    params.require(:transaction).permit(:amount, :account_id, :transaction_type)
  end

  def current_account_balance
    last_transaction = Transaction.where(account_id: transaction_params[:account_id]).order(created_at: :desc).first
    last_balance = last_transaction&.account&.balance || 0
    if transaction_params[:transaction_type] == 'debit'
      last_balance - transaction_params[:amount]
    else
      last_balance + transaction_params[:amount]
    end
  end
end
