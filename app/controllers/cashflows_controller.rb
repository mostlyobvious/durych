class CashflowsController < ApplicationController
  def show; end

  def update
    Turbo::StreamsChannel.broadcast_replace_to "cashflow", target: "cashflow", content: "<h1>reloaded<h1>"

    render turbo_stream: turbo_stream.replace("cashflow", "<h1>loading...</h1>")
  end

  def table
    render partial: "loaded"
  end
end
