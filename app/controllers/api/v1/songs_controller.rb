# frozen_string_literal: true

module Api
  module V1
    class SongsController < ApiController
      def index
        @songs = Song.all.limit(100) # You can adjust or add pagination
        render json: @songs
      end	      

      def show
        @song = Song.find(params[:id])
        render json: @song
      end
    end
  end
end
