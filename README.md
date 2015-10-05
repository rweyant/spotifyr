# spotifyr: a wrapper for Spotify's API for R users

# Installation
```{r}
devtools::install_github('rweyant/spotifyr')
```

# Authentication

For any usage below, you'll need to have proper credentials from Spotify.  Sign up for an account [here](https://developer.spotify.com/) and [create an app](https://developer.spotify.com/my-applications/#!/applications).

```{r}
# First Step: make client_id and client_secret available to other function
set_credentials(client_id=YOUR_CLIENT_ID,client_secret=YOUR_CLIENT_SECRET)
```

## Authenticate with [Client Credentials](https://developer.spotify.com/web-api/authorization-guide/#client_credentials_flow)

```{r}
client_tokens <- get_tokens()
```

## Authenticate with [Authorization Code](https://developer.spotify.com/web-api/authorization-guide/#authorization_code_flow)

```{r}
# Opens Browser window asking for permission to access data
user_code <- get_user_code()

# Assigns tokens for later use.
# This creates a variable access_token in the Global Environment 
# that all future functions will access.
user_tokens <- get_user_token(user_code)

# If your access_token expires and you need to refresh your tokens 
# With no parameters specified, looks for refresh_token in the Global Environment
refresh_tokens <- refresh_user_token()
# If you want, you can explicitly specify the refresh token
refresh_tokens <- refresh_user_token(user_tokens$refresh_token)
```

# Basic Usage



## User Profile Data
```{r,eval=FALSE}
# Specific user's data
get_user_profile('rweyant')

# Get the user who is using the application
get_current_user_profile()
```


## More Resources

- [Spotify API Endpoints](https://developer.spotify.com/web-api/endpoint-reference/)
- [Source on GitHub](https://github.com/rweyant/spotifyr)
