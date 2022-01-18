# For information about configuration values that can be set in this file see:
#
#   https://docs.mopidy.com/en/latest/config/
#
# Run `sudo mopidyctl config` to see the current effective config, based on
# both defaults and this configuration file.

[http]
enabled = true
hostname = ::
port = 6680

[spotify]
username = {{ spotify_user }}
password = {{ spotify_password }}
client_id = {{ spotify_client_id }}
client_secret = {{ spotify_client_secret }}
bitrate = 320

[audio]
output = {{ audio_sink }}

[iris]
country = {{ country }}
locale = {{ locale }}

[podcast]
browse_route = {{ podcasts_opml_url }}
