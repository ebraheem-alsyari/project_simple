class DemoController < ApplicationController
    layout 'application'
    layout 'admin'
    def index
      render('index')
    end
     # this demo
  
    def hello
      render('login')
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
