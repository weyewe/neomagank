class PortfoliosController < ApplicationController
  def index
    @profile = current_user.profile
    @portfolio = Portfolio.new 
    @portfolios = current_user.portfolios.order("created_at DESC")
  end
  
  def create
    @portfolio = Portfolio.create_and_extract_transloadit(params, current_user)
    
    
    redirect_to portfolio_url(@portfolio)
  end
  
  def update
  end
  
  def show
    @profile = current_user.profile
    @portfolio = Portfolio.find( params[:id])
    @images = @portfolio.get_show_images
  end
  
end
