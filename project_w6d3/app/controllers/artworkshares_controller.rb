class ArtworksharesController < ApplicationController

  def index
        @artworkshares = Artworkshare.all 
        render json: @artworkshares
  end

  def create
            artworkshare = Artworkshare.new(params.require(:artist_id).permit(:artwork_id, :viewer_id))
            if artworkshare.save
              render json: artworkshare
            else
              render json: artworkshare.errors.full_messages, status: :unprocessable_entity
            end
  end 



  def destroy
        @artworkshare = Artworkshare.find(params[:id])
        @artworkshare.destroy
        render json: @artworkshare
  end
    
   

    private 

    def artwork_shares_params 
        params.require(:artist_id).permit(:artwork_id, :viewer_id)
    end 
    


end