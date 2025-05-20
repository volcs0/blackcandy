# frozen_string_literal: true

module Api
  module V1
    class SongsController < ApiController
      def index
        if params[:album_id]
          @songs = Song.where(album_id: params[:album_id]).limit(100)
        elsif params[:artist_id]
          @songs = Song.where(artist_id: params[:artist_id]).limit(100)
        else
          @songs = Song.all.limit(100) # You can adjust or add pagination
        end
        render json: @songs
      end	      

      def show
        @song = Song.find(params[:id])
        render json: @song
      end
    end
  end
end
