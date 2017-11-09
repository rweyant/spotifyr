
#' Check API call executed correctly
get_response_content <- function(response){

  if(!(status_code(response) %in% c(200, 201, 204)))
    stop(paste('\nError Code: ', content(response)$error$status,'\n', content(response)$error$message))

  # Otherwise, return content
  content(response)
}

# simplify_result <- function(result,type='artists'){
#
#   # Improve here. Move to S3.
#   if(type=='artists') df <- simplify_result.artist(result)
#
#   if(type=='songs') df <- simplify_result.song(result)
#
#   if(type=='albums') stop('Albums not yet supported')
#   if((type=='categories')) stop('Categories not yet supported')
#
#   as.data.frame(df,stringsAsFactors = FALSE)
# }
#
# simplify_result.song <- function(x){
#   if ('items' %in% names(x)){
#     tmp <-  x[['items']]
#   } else if ('tracks' %in% names(x)) {
#     tmp <- x[['tracks']]
#   } else tmp <- x
#
#   # Delete some data
#   tmp <- lapply(tmp, function(x){
#     x$available_markets <- NULL
#     x$album$available_markets <- NULL
#     x
#   })
#
#   ldply(tmp,data.frame)
# }
#
# simplify_result.artist <- function(x){
#   if('artists' %in% names(x)) tmp <- x[['artists']][['items']]
#   else if ('items' %in% names(x)) tmp <- x[['items']]
#   else if (is.null(names(x))) tmp <- x
#
#   ldply(
#     lapply(tmp,function(artist){
#       artist$genre <- paste(artist$genres,collapse='|')
#       artist$followers <- artist$followers$total
#       artist[c('name','id','genre','popularity','followers','href','type','uri')]
#     }),
#     data.frame
#   )
# }
#
# ## Hmm.  Problem here
# simplify_result.album <- function(x){
#   if('albums' %in% names(x)){
#     tmp <- x[['albums']][['items']]
#   } else if ('items' %in% names(x)) tmp <- x[['items']]
#
#   ldply(
#     lapply(tmp,function(album){
#       album$artist <- paste(sapply(album$artists,function(x) x$name),collapse='|')
#       album$genre <- paste(album$genres,collapse='|')
#       album$ntracks <- length(album$tracks$items)
#       album[c('name','id','uri','artist','genre','ntracks','href','type')]
#     }),
#     data.frame
#   )
# }

