class DrunkenparrotflatuiDemoController < ApplicationController
  layout :layout_for_page

  private

  def layout_for_page
    case params[:id]
    when 'index'
      'index'
    when 'documentation'
      'documentation'
    when 'start-here'
      'start-here'      
    else
      'application'
    end
  end  
end
