class TimeplotController < ApplicationController
  
  def index
    
  end
  
  def timeplot
    
  end
  
  def search
    
    unless params[:search_text].nil? || params[:search_text].empty?  
      
      csv = Timeplot.fetch(params[:search_text]) 

      
      render :text => csv
    else
      redirect_to(:controller => 'timeplot', :action => 'timeplot')
    end
  end
end
