class StreamItemsController < ApplicationController
  
  def show
  end
  
  def destroy
    @stream_item = StreamItem.find(params[:id])
    if @stream_item.destroy
      flash[:notice] = 'Ist weg!'
    else
      flash[:notice] = 'Und kaputt! Das war nix.'
    end
    redirect_to root_path
  end
  
end