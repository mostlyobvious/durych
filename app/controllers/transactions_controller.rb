class TransactionsController < ApplicationController
  def index
    respond_to do |format|
      format.html { render :index, locals: { transactions: transactions(params) } }
      format.turbo_stream do
        render turbo_stream.replace(
          "transactions",
          partial: "transactions/table",
          locals: { transactions: transactions(params) })
      end
    end
  end

  private

  Transaction = Struct.new(:date, :title, :amount)
  private_constant :Transaction

  def transactions(params)
    transactions = [
      Transaction.new(Date.new(2022, 1, 1), "ABC", 123.45),
      Transaction.new(Date.new(2022, 2, 1), "BCD", 123.45),
      Transaction.new(Date.new(2022, 3, 1), "CDE", 123.45),
      Transaction.new(Date.new(2022, 4, 1), "EFG", 123.45),
      Transaction.new(Date.new(2022, 5, 1), "GHI", 123.45),
    ]

    return transactions unless params[:search].present?

    transactions.select { |t| t.title.downcase.include?(params[:search].downcase) }
  end
end
