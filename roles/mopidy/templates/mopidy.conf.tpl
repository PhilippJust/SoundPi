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

[audio]
output = {{ audio_sink }}

[iris]
country = {{ country }}
locale = {{ locale }}
