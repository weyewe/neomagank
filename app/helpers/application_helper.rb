require 'time'
module ApplicationHelper
  

  
  # the object has to respond to starting_date end ending_date methods
  def give_interval(work_experience)
    result = ""
    if work_experience.starting_date.nil? 
      return "..."
    end
    
    result << work_experience.starting_date.strftime("%b %Y - ")
    if work_experience.ending_date.nil?
      result << "Present"
    else
      result << work_experience.ending_date.strftime("%b %Y")
    end
    
    if  ( not work_experience.ending_date.nil? ) && ( work_experience.starting_date > work_experience.ending_date)
      return "..."
    end
    
    return result
  end
  
  def skill_level_visualizer( proficiency)
    if proficiency == nil 
      return "l-1"
    end
    
    return "l-#{proficiency}"
  end
  

  def transloadit_value_profile_json( resource )
    value = {}
    value["auth"] = {
      "key" => "a919ae5378334f20b8db4f7610cdd1a7"
    }

    value["template_id"] = "e576fa9a05004f98b0300ea12e2e2c20"
    if resource.new_record? 
      value["redirect_url"] = profiles_url
    else
      value["redirect_url"] = profile_url( resource  )
    end
    value["notify_url"] = "http://google.com"
    value.to_json
  end
  
  
  def transloadit_value_portfolio_json( portfolio , portfolio_image )
    value = {}
    value["auth"] = {
      "key" => "a919ae5378334f20b8db4f7610cdd1a7"
    }

    value["template_id"] = "8595a33c8a8c4ac591b221cac9f478dd"
    
    if portfolio_image.nil?
      if portfolio.new_record? 
        value["redirect_url"] = portfolios_url
      else
        value["redirect_url"] = portfolio_url( portfolio  )
      end
    else
      if portfolio_image.new_record? 
        value["redirect_url"] = portfolio_portfolio_images_url( portfolio )
      else
        value["redirect_url"] = portfolio_portfolio_image( portfolio , portfolio_image )
      end
    end
    
    value.to_json
  end
  
  
  
  
end
