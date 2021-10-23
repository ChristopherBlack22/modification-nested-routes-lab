module ArtistsHelper
  def display_artist(song)
    song.artist.nil? ? link_to("Add Artist", edit_song_path(song)) : link_to(song.artist_name, artist_path(song.artist))
  end

  def artist_select(song, artist_id)
    #binding.pry
    if song.artist && artist_id
      @artist = Artist.find(artist_id)
      hidden_field_tag "song[:artist_id]", @artist
      @artist.name
    else
      select_tag "song[:artist_id]", options_from_collection_for_select(Artist.all, :id, :name, song.artist.id.to_i)

    # if artist_id.nil?
    #   select_tag "song[:artist_id]", options_from_collection_for_select(Artist.all, :id, :name, song.artist.id.to_i)
    # else
    #   @artist = Artist.find(artist_id)
    #   hidden_field_tag "song[:artist_id]", @artist
    #   @artist.name
        
    end
  end 

end
