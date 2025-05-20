class Api::V1::ArtistsController < Api::V1::ApiController
  def index
    artists = Artist.all
    render json: artists
  end

  def show
    artist = Artist.find(params[:id])
    render json: artist
  end
end

