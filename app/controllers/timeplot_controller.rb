class TimeplotController < ApplicationController
  
  def index
    
  end
  
  def timeplot
    
  end
  
  def search
    
    unless params[:search_text].nil? || params[:search_text].empty?  
      
      json = DigitalNz::TimelineSearch.query(params[:search_text]) 

      
      
      render :json => json
    else
      redirect_to(:controller => 'timeplot', :action => 'timeplot')
    end
  end
end
