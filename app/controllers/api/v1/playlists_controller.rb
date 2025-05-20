class Api::V1::PlaylistsController < Api::V1::ApiController
  def index
    render json: Playlist.all
  end

  def show
    render json: Playlist.find(params[:id])
  end

def create
  playlist = current_user.playlists.new(playlist_params)
  if playlist.save
    render json: playlist, status: :created
  else
    render json: { errors: playlist.errors.full_messages }, status: :unprocessable_entity
  end
end

  def update
    playlist = Playlist.find(params[:id])
    if playlist.update(playlist_params)
      render json: playlist
    else
      render json: { errors: playlist.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    playlist = Playlist.find(params[:id])
    playlist.destroy
    head :no_content
  end

  # GET /playlists/:playlist_id/songs
  def songs
    playlist = Playlist.find(params[:playlist_id])
    render json: playlist.songs
  end

  # POST /playlists/:playlist_id/add_song/:song_id
  def add_song
    playlist = Playlist.find(params[:playlist_id])
    song = Song.find(params[:song_id])
    playlist.songs << song unless playlist.songs.include?(song)
    render json: playlist.songs
  end

  # DELETE /playlists/:playlist_id/remove_song/:song_id
  def remove_song
    playlist = Playlist.find(params[:playlist_id])
    song = Song.find(params[:song_id])
    playlist.songs.delete(song)
    render json: playlist.songs
  end

  private

  def playlist_params
    params.require(:playlist).permit(:name)
  end
end

