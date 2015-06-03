require 'json' 

class GroupNotesController < ApplicationController
  def create
  	group_note = GroupNote.new(gn_params)
  	if group_note.save
      flash[:message] ='Note Added'
      redirect_to "/groups/select/#{gn_params[:group_id]}"
      # json_data = {message:"success", }
      # render json:json_data
  	else
  		flash[:message] ='No success'
  		redirect_to "/groups/select/#{gn_params[:group_id]}"
  	end
  
  end

  def delete
    if gn_delete_params[:view] ='true'
      group_note = GroupNote.find(gn_delete_params[:gnote]).delete
      flash[:message] ='Note Removed'
      redirect_to "/groups/view/#{gn_delete_params[:group_id]}"

    else
      group_note = GroupNote.find(gn_delete_params[:gnote]).delete
      flash[:message] ='Note Removed'
      redirect_to "/groups/select/#{gn_delete_params[:group_id]}"
      
    end
  	

  end

  def update
  end
  private
  def gn_params
  	params.require(:group_note).permit(:note_id, :group_id,:user_id)
  end

  def gn_delete_params
  	params.require(:group_note).permit(:note_id,:group_id,:user_id,:gnote,:view)
  end
end
