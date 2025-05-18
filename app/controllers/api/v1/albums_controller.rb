class Api::V1::AlbumsController < Api::V1::BaseController
  def index
    albums = Album.all
    render json: albums.as_json(only: [:id, :name, :cover], methods: [:artist_name])
  end

  def show
    album = Album.find(params[:id])
    render json: album.as_json(
      only: [:id, :name, :cover],
      methods: [:artist_name],
      include: {
        songs: { only: [:id, :title, :duration, :track] }
      }
    )
  end
end

