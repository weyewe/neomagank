class PortfolioImagesController < ApplicationController
  def create
    @portfolio = Portfolio.find( params[:portfolio_id] )
    @portfolio_image = PortfolioImage.create_from_transloadit( params , @portfolio)
    
    # @images = PortfolioImage.find(:all, :conditions => {
    #   :portfolio_id => @portfolio.id ,
    #   :image_type => "show"
    # })
    @images = @portfolio.get_show_images
    
    
    respond_to do |format|
      format.html { redirect_to portfolio_url( @portfolio)}
      format.js
    end
  end
end
