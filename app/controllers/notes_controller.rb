class NotesController < ApplicationController
  def create
    @user = User.first
    @note = @user.notes.build(note_params)
    @note.date = Date.today
    
    if @note.save
      redirect_to root_path
    else
      redirect_to root_path, alert: "Error saving note"
    end
  end

  def update
    @note = Note.find(params[:id])
    @note.update(note_params)
    redirect_to root_path
  end

  def destroy
    @note = Note.find(params[:id])
    @note.destroy
    redirect_to root_path
  end

  private

  def note_params
    params.require(:note).permit(:content, :energy_level, :mood)
  end
end