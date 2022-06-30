class ResponsesController < ApplicationController
  def index
    p params

    respond_to do |format|
      format.html
      format.json { render json: { hop: "hop" } }
      format.turbo_stream { render turbo_stream: turbo_stream.update("response", inline: "welp") }
    end
  end
end
