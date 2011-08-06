class LiveItemsController < StreamItemsController

  def show
    redirect_to root_path
  end
  
  def new
    @live_item = LiveItem.new
    @live_item.date = DateTime.now
    @live_item.showtime = Time.now
  end
  
  def edit
    @live_item = LiveItem.find(params[:id])
  end
  
  def create
    item = LiveItem.new(params[:live_item])
    item.user = current_user
    if item.save
      flash[:notice] = 'Toll gemacht!'
    else
      flash[:notice] = 'Ka-BOOOOM!!! Irgendwas ist kaputt. Keine Sorge, der WoGo wird\'s richten!'
    end
    redirect_to root_path
  end
  
  def update
    @live_item = LiveItem.find(params[:id])
    if @live_item.update_attributes(params[:live_item])
      flash[:notice] = 'Eintrag wurde erfolgreich bearbeitet.'
      redirect_to root_path
    else
      flash[:error] = 'Ein Fehler ist aufgetreten. ... Oli? Bist du das???'
      render :action => :edit
    end
  end
  
end