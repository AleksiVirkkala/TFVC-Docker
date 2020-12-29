set -e

if [ -n "$PAT" ] && [  -n "$SERVER" ]
then
  # Skip oauth to configure with access token
  export TF_BYPASS_BROWSER_LOGIN=true
  # Dummy request that triggers setting up credentials
  tf workspaces -server:"$SERVER" -login:"PersonalAccessToken,$PAT" > /dev/null
fi

exec ${@:-/bin/sh}