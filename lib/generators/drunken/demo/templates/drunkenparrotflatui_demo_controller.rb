class DrunkenparrotflatuiDemoController < ApplicationController
  def index
    render layout: "index"
  end

  def documentation
    render layout: "documentation"
  end

  def start_here
    render layout: "start_here"
  end 
end
