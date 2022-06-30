class TransactionsController < ApplicationController
  def index
    respond_to do |format|
      format.html { render :index, locals: { transactions: transactions } }
    end
  end

  private

  Transaction = Struct.new(:date, :title, :amount)
  private_constant :Transaction

  def transactions
    [
      Transaction.new(Date.new(2022, 1, 1), "AAA", 123.45),
      Transaction.new(Date.new(2022, 2, 1), "BBB", 123.45),
      Transaction.new(Date.new(2022, 3, 1), "CCC", 123.45),
      Transaction.new(Date.new(2022, 4, 1), "DDD", 123.45),
      Transaction.new(Date.new(2022, 5, 1), "EEE", 123.45),
    ]
  end
end
