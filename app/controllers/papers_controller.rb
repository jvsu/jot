require 'json' 

class PapersController < ApplicationController
  def index
     @user = User.find(session[:user_id])
     @papers = Paper.all.where(:user_id=>@user.id)
  end

  def new
    @user = User.find(session[:user_id])
    @paper = Paper.find(params[:paper_id])
    @notes = Note.all.where(:user_id=>@user.id,:paper_id=>@paper.id)
    @points = Point.all.where(:paper_id=>@paper.id)
    @supports = PointSupport.all.where(:user_id=>@user.id)
  end

  def create
    paper =Paper.new(paper_params)
    if paper.save
      flash[:message]= "Paper Created"
      redirect_to "/papers/new/#{paper.id}"
    else
      flash[:message]= "Error"
      redirect_to "/papers/index"
    end
  end

  def edit
    # Need to write code for blank entries
    paper = Paper.find(paper_edit_params[:paper_id]).update(:thesis=>paper_edit_params[:thesis], :name=>paper_edit_params[:name])
    thesis = paper_edit_params[:thesis]
    name = paper_edit_params[:name]
    json_data = {thesis:thesis,name:name}
    render json:json_data

  end

  def all

  end

  def view
  end
  def delete
    paper = Paper.find(params[:paper_id]).delete
    redirect_to "/papers/index"
  end
  private
    def paper_params
        params.require(:paper).permit(:user_id, :thesis, :name)
    end

    def paper_edit_params
      params.require(:paper).permit(:user_id, :thesis, :name, :paper_id)
    end
    

end