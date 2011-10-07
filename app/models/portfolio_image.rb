class PortfolioImage < ActiveRecord::Base
  belongs_to :portfolio
  
  def self.create_from_transloadit( params , portfolio ) 
    if params[:transloadit].nil? 
      return nil
    end
    
    portfolio.assign_transloadit( params )
    
  end
end
