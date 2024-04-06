# Global Activity Data
Discord stores some basic data about the activity. The following functions can be used to retrieve it

## discord_sdk_get_client_id()
Returns the client ID stored in the SDK instance

## discord_sdk_get_channel_id()
Returns the channel ID where the activity is currently being played, or a blank string if the SDK is uninitialised.

## discord_sdk_get_guild_id()
Returns the guild ID where the activity is currently being played, or a blank string if the SDK is uninitialised.

## discord_sdk_get_instance_id()
Returns the instance ID where the activity is currently being played, or a blank string if the SDK is uninitialised.
The instance ID is shared between anyone playing the same activity in the same channel. 

## discord_sdk_get_frame_id()
Returns the Frame ID of the current activity. This appears to be a random identifier assigned when each player starts up an activity. Changes between restarts of the activity. 


