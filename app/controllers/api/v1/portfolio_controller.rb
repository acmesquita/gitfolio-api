class Api::V1::PortfolioController < ApplicationController

  def search
    @portfolios = Portfolio.all
    render :json, @portfolios
  end
end
