class PortfoliosController < ApplicationController
  def index
    @profile = current_user.profile
    @portfolio = Portfolio.new 
  end
  
  def create
    @portfolio = Portfolio.create_and_extract_transloadit(params, current_user)
    
    redirect_to portfolio_url(@portfolio)
  end
  
  def update
  end
  
  def show
  end
  
end
