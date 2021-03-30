class SubjectsController < ApplicationController

  layout 'admin'

  def index
    @subjects = Subject.sorted
  end

  def show
    @subject = Subject.find(params[:id])
    @page_title = "baswbya"
  end



  def new
    @subject = Subject.new
  end
  

  def create
    @subject = Subject.new(subject_params)
    if @subject.save
      flash[:notice] = "Subject created successfully"
      redirect_to(subjects_path)
    else
      render('new')
    end
  end



  def edit
    @subject = Subject.find(params[:id]) 
  end


  def update
    @subject = Subject.find(params[:id])
    if @subject.update_attributes(subject_params)
      flash[:notice] = "Subject updated successfully"
      redirect_to(subject_path(@subject))
    else

      render('edit')
    end

  end



  def delete
    @subject = Subject.find(params[:id])
  end

  def destroy
    @subject = Subject.find(params[:id])

    if@subject.destroy
    flash[:notice] = "Subject deleted successfully"
    redirect_to(subjects_path)
    else
    end

  end

  private

  def subject_params
    params.require(:subject).permit(:name, :position, :visible,)
  end



end