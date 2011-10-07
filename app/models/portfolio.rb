class Portfolio < ActiveRecord::Base
  belongs_to :user
  has_many :portfolio_images
  extend FriendlyId
  friendly_id :title, :use => :slugged

  
  
  
  
  def self.create_and_extract_transloadit( params , current_user)
    portfolio = self.new( params[:portfolio] )
    portfolio.user_id = current_user.id
    portfolio.save
    if params[:transloadit]
      portfolio.assign_transloadit( params , portfolio)
    end
    portfolio
  end
  
  def get_teaser_image
    teaser_image = self.portfolio_images.find(:first, :conditions => {
      :image_type => "teaser"
    })
    
    if teaser_image.nil?
      teaser_image = DEFAULT_PORTFOLIO_INDEX_IMAGE
    else
      teaser_image = teaser_image.image_url 
    end
    teaser_image
  end
  
  def get_show_images
    show_images = self.portfolio_images.find(:all, :conditions => {
      :image_type => "show"
    })
    
    if show_images.length != 0 
      show_images =  show_images.map{ |x| x.image_url }
    end

    show_images
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
