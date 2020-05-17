class Api::V1::PortfolioController < ApplicationController

  def search
    @portfolios = Portfolio.by_login_name_or_email(params[:q])
    @portfolios = Portfolio.no_query_value if @portfolios.empty?
    
    render json: @portfolios, status: :ok
  end

  def show
    set_portfolio
    render json: @portfolio, status: :ok
  end

  def create
    @portfolio = Portfolio.new(portfolio_params)
    if(@portfolio.save)
      render json: @portfolio, status: :created
    else
      render json: {error: 'Não foi possível criar o Portfólio'}, status: '404'
    end
  end

  private

  def set_portfolio
    @portfolio = Portfolio.find(params[:id])
  end

  def portfolio_params
    params.require(:portfolio).permit!
  end
end
