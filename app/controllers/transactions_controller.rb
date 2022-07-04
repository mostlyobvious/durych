class TransactionsController < ApplicationController
  def index
    respond_to do |format|
      format.html { render :index, locals: { transactions: transactions(params), categories: categories } }
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace(
          "transactions",
          partial: "transactions/table",
          locals:  { transactions: transactions(params) })
      end
    end
  end

  private

  Transaction = Struct.new(:date, :title, :amount, :category)
  private_constant :Transaction

  def transactions_list
    [
      Transaction.new(Date.new(2022, 1, 1), "ABC", 123.45, "Category 1"),
      Transaction.new(Date.new(2022, 2, 1), "BCD", 123.45, "Category 2"),
      Transaction.new(Date.new(2022, 3, 1), "CDE", 123.45, "Category 1"),
      Transaction.new(Date.new(2022, 4, 1), "EFG", 123.45, "Category 2"),
      Transaction.new(Date.new(2022, 5, 1), "GHI", 123.45, "Category 3"),
    ]
  end

  def transactions(params)
    transactions_list
      .select { |t| params[:search].present? ? t.title.downcase.include?(params[:search].downcase) : true }
      .select { |t| params[:category].present? ? t.category == params[:category] : true }
  end

  def categories
    transactions_list.map(&:category).uniq
  end
end
