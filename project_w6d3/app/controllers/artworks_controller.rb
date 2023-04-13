class ArtworksController < ApplicationController 

  def index
        @artworks = Artwork.where(artist_id: params[:user_id])
        # @artworks = Artwork.select('*').where(params[:user_id])
        render json: @artworks
    end
    #artworks_for_user_id
    # The artworks owned by a user
    # AND
    # The artworks shared with the user


        def create
            artwork = Artwork.new(params.require(:artist_id).permit(:title, :image_url))
            if artwork.save
              render json: artwork
            else
              render json: artwork.errors.full_messages, status: :unprocessable_entity
            end
        end 

        
    def show
        @artwork = Artwork.find(params[:id])
        render json: @artwork
    end

    def update 
        @artwork = Artwork.find(params[:id])

        if @artwork.update(artwork_params)
            render json: @artwork 
        else
            render json: artwork.errors.full_messages, status: 422
        end

    end

    
    def destroy
        @artwork = Artwork.find(params[:id])
        @artwork.destroy
        render json: @artwork 
    end

    private 

    def artwork_params 
        params.require(:artist_id).permit(:title, :image_url)
    end 






end