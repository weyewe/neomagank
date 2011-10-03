require 'transloadit'
require 'open-uri'
class Profile < ActiveRecord::Base
  belongs_to :user
  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h 
  
  
  

  def execute_cropping( params_profile )
    x1 = params_profile[:crop_x].to_i
    y1 = params_profile[:crop_y].to_i
    x2 = x1 +  params_profile[:crop_w].to_i
    y2 = y1 +  params_profile[:crop_h].to_i

    crop_avatar( x1,x2,y1,y2)
  end
  
  
  
  def crop_avatar( x1,x2, y1,y2)
    transloadit = Transloadit.new(
      :key    => 'a919ae5378334f20b8db4f7610cdd1a7',
      :secret => '7dff49aab9dc91cb62a0fd34bf9e8c2d6eb3b207'
    )


    crop = transloadit.step 'crop', '/image/resize', :crop => {
      :x1  => x1,
      :x2 => x2,
      :y1 => y1,
      :y2 => y2
    }, :resize_strategy => "crop"
    
    resize = transloadit.step 'resize', '/image/resize', 
      :width => 100,
      :height => 100,
      :resize_strategy => "crop"
    
    store  = transloadit.step 'store', '/s3/store',
      :key    => 'AKIAJDZQX6OYP3JGD5VQ',
      :secret => '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',
      :bucket => 'mdlns', 
      :use => 'resize'

    assembly = transloadit.assembly(
      :steps => [ crop,resize, store ]
    )
    
    file = open(self.profile_pic)
    response = assembly.submit! file

    while not response.completed? do
      sleep 1
      response.reload!
    end
    
    puts "The content of result is \n"*10
    puts response["results"]
    self.cropped_profile_pic = response["results"]["resize"].first["url"]
    self.save
    
  end
  
  


  
  
#   Trandloadit related
#   Trandloadit related
  def update_and_extract_transloadit( params )
    self.assign_transloadit( params )
  end
  
  def assign_transloadit( params )
    transloadit = ActiveSupport::JSON.decode(params[:transloadit])#.symbolize_keys[:uploads]
    transloadit_results = ActiveSupport::JSON.decode(params[:transloadit]).symbolize_keys[:results]

    if transloadit_results.length != 0 
     self.profile_pic = get_url_from_transloadit( transloadit_results, "avatar_profile"  )   
     self.save
    end
  end
  
  def get_url_from_transloadit( transloadit_results, type)
    a =  transloadit_results[type]  
    a.first["url"]
  end
end
