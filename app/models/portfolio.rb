class Portfolio < ActiveRecord::Base
  belongs_to :user
  has_many :portfolio_images
  
  def self.create_and_extract_transloadit( params , current_user)
    portfolio = self.new( params[:portfolio] )
    portfolio.user_id = current_user.id
    portfolio.save
    if params[:transloadit]
      portfolio.assign_transloadit( params )
    end
    portfolio
  end
  
  
  def assign_transloadit( params )
    transloadit = ActiveSupport::JSON.decode(params[:transloadit])#.symbolize_keys[:uploads]
    transloadit_results = ActiveSupport::JSON.decode(params[:transloadit]).symbolize_keys[:results]

    if transloadit_results.length != 0 
      # self.destroy_current_images
      for type in TRANSLOADIT["portfolio_image"]["return_value"]
        self.portfolio_images.create( :image_type => type , 
        :image_url => get_url_from_transloadit( transloadit_results, type ) ,
        :is_first => true)
      end
    end
  end
  
  
  def destroy_current_images
    self.portfolio_images.each do |f |
      f.destroy
    end
  end
  
  def get_url_from_transloadit( transloadit_results, type)
    a = transloadit_results[type]  
    a.first["url"]
  end
  
  
  
  
  
  
end
