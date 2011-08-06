class HomeItemsController < StreamItemsController

  def show
    redirect_to root_path
  end
  
  def new
    @home_item = HomeItem.new
  end
  
  def edit
    @home_item = HomeItem.find(params[:id])
  end
  
  def create
    item = HomeItem.new(params[:home_item])
    item.user = current_user
    if item.save
      flash[:notice] = 'Toll gemacht!'
    else
      flash[:notice] = 'Ka-BOOOOM!!! Irgendwas ist kaputt. Keine Sorge, der WoGo wird\'s richten!'
    end
    redirect_to root_path
  end
  
  def update
    @home_item = HomeItem.find(params[:id])
    if @home_item.update_attributes(params[:home_item])
      flash[:notice] = 'Eintrag wurde erfolgreich bearbeitet.'
      redirect_to root_path
    else
      flash[:error] = 'Ein Fehler ist aufgetreten. ... Oli? Bist du das???'
      render :action => :edit
    end
  end
  
  # def destroy
  #   @stream_item = HomeItem.find(params[:id])
  #   if @stream_item.destroy
  #     flash[:notice] = 'Ist weg!'
  #   else
  #     flash[:notice] = 'Und kaputt! Das war nix.'
  #   end
  #   redirect_to root_path
  # end
  
  
end