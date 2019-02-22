class DressesController < ApplicationController

 before_action :find_dress, only: [:show, :edit, :update, :destroy, :verified]

  def index
  if params[:search]
    @dresses = Dress.search(params[:search])
  else
    @dresses = Dress.all
  end 
  end


  # GET /dresses/new
  def new
    @dress = current_user.dresses.build
  end


def show
  @dress = Dress.find(params[:id])
end
  # GET /dresses/1/edit
  def edit
  end

  # POST /dresses
  # POST /dresses.json
  def create
      @dress = current_user.dresses.build(dress_params)
    if @dress.save
      redirect_to '/dresses'
    else
      flash[:message] = "Dress listing was not posted"
      render 'new'
    end
  end


  def update
  if @dress.update(dress_params)
    redirect_to dress_path(@dress)
  else 
    render "edit"
  end 
  end

  # DELETE /dresses/1
  # DELETE /dresses/1.json
  def destroy
    @dress.destroy
    respond_to do |format|
      format.html { redirect_to'/dresses', notice: 'Dress was successfully destroyed.' }
      format.json { head :no_content }
   end
  end
      



def verified 
  if current_user.admin?
    @dress.verify = true
    @dress.save
  else
    flash[:message] = "Sorry, you are not authorized"
  end 
  redirect_to dress_path(@listing)
end 

def cart_action(current_user_id)
  if $redis.sismember "cart#{current_user_id}", id
    "Remove from"
  else
    "Add to"
  end
end

  private
  def find_dress
      @dress = Dress.find(params[:id])
    end

   def dress_params
      params.require(:dress).permit(:title, :description, :text, :price, :dress_img)
   end

end

