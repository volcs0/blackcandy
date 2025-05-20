class Api::V1::SearchController < Api::V1::ApiController
  def index
    query = params[:q].to_s
    like_query = "%#{query.downcase}%"

    results = {
      songs:     Song.where("LOWER(name) LIKE ?", like_query),
      albums:    Album.where("LOWER(name) LIKE ?", like_query),
      artists:   Artist.where("LOWER(name) LIKE ?", like_query),
      playlists: Playlist.where("LOWER(name) LIKE ?", like_query)
    }
    render json: results
  end
end
