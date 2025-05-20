class Api::V1::AlbumsController < Api::V1::ApiController

def index
  if params[:artist_id]
    albums = Album.where(artist_id: params[:artist_id])
    render json: albums
  else
    albums = Album.all
    render json: albums
  end
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

