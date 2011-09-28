require 'time'
module ApplicationHelper
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
end
