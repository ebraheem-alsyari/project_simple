class PagesController < ApplicationController
  


  layout 'admin' 

  before_action :find_subjects, :only => [:new, :create, :edit, :update]
  before_action :set_page_count, :only => [:edit, :update, :new, :create]
  before_action :confirm_logged_in
  def index
    @pages = Page.sorted
  end
  
  def show
    @page = Page.find(params[:id]) 
  end
  
  def new
    @page = Page.new

  end
  
  def create
    @page = Page.new(page_params)
    if @page.save
      flash[:notice] = "page created successfully."
      redirect_to(pages_path)
    else
      render('new')
    end
  end
  
  def edit
    @page = Page.find(params[:id])



  end
  
  def update
    @page = Page.find(params[:id])
    if @page.update_attributes(page_params)
      flash[:notice] = "page created successfully."
      redirect_to(page_path(@page))
    else

      render('show')
    end
  end
  
  
  def delete
    @page = Page.find(params[:id])
  end

  def destroy
    @page = Page.find(params[:id])
    @page.destroy
    flash[:notice] = "page destroyed successfully."
    redirect_to(pages_path)
  end
  
  
  private
  
  def page_params
    params.require(:page).permit(:subject_id, :name, :position, :visible, :permalink)
  end


  def find_subjects
    @subjects = Subject.sorted
  end

    def set_page_count
      @page_count = Page.count
      if params[:action] == 'new' || params[:action] == 'creat'
        @page_count += 1
    end
  end

end
