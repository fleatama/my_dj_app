var tag = document.createElement('script');
tag.src = "https://www.youtube.com/iframe_api";
var firstScriptTag = document.getElementsByTagName('script')[0];
firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

@onYouTubeIframeAPIReady = ()->
  movie = youtube_url # なんか入れてください
  $(".title").html(movie.title)
  player = new YT.Player('player',{
    height: '390',
    width: '640',
    videoId: movie.id,
    events: {
      onReady: onPlayerReady,
      onStateChange: onPlayerStateChange,
      onError: onPlayerError
    }
  })

@playNext = (player)->
  player.clearVideo()
  movie = youtube_movie # 次に再生したい動画id
  $(".title").html(movie.title)
  player.loadVideoById(movie.id,0,"large")
  player.playVideo()

@onPlayerReady = (event)->
  event.target.playVideo()

@onPlayerStateChange = (event)->
  if event.data == YT.PlayerState.ENDED
    playNext(event.target)

@onPlayerError = (event)->
  playNext(event.target)