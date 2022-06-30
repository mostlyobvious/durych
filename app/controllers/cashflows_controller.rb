class CashflowsController < ApplicationController
  def show; end

  def update
    Thread.new do
      sleep(2)
      Turbo::Streams::ActionBroadcastJob.perform_later("cashflow", action: "update", target: "cashflow", content: "Reloaded")
    end

    render turbo_stream: turbo_stream.replace("cashflow", <<~ERB.html_safe)
      <h1 id="cashflow">loading...</h1>
    ERB
  end

  def table
    render turbo_stream: turbo_stream.replace("cashflow", partial: "loaded")
  end
end
