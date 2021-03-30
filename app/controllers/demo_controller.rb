class DemoController < ApplicationController
    layout 'application'
  
    def index
      render('index')
    end
     # this demo
  
    def hello
      @array = [1,2,3,4,5,6,7]
      @id = params['id']
      @page = params[:page]
      render('hello')
    end
  
    def other_hello
      redirect_to(:action => 'index')
      # redirect_to(:controller => 'demo', :action => 'index')
    end
  
    def lynda
      redirect_to("http://lynda.com")
    end
    
    def escape_output
    end
  
  end