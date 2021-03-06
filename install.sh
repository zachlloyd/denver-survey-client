#!/bin/bash
#
# Warp Survey installer
#
# Usage:
#   curl -s https://raw.githubusercontent.com/warpdotdev/warp-cli-survey/master/install.sh | bash && /tmp/dsurvey

VERSION="0.2.1"

set -e

function run_denver_survey() {
  echo "Installing survey (v$VERSION) to /tmp/dsurvey"
  if [[ "$OSTYPE" == "linux-gnu" ]]; then
      curl -fsSL https://github.com/warpdotdev/warp-cli-survey/releases/download/$VERSION/dsurvey.$VERSION.linux.x86_64.tar.gz | tar -xzv dsurvey > /dev/null 2>&1
      mv dsurvey /tmp/dsurvey
      chmod +x /tmp/dsurvey
  elif [[ "$OSTYPE" == "darwin"* ]]; then
      curl -fsSL https://github.com/warpdotdev/warp-cli-survey/releases/download/$VERSION/dsurvey.$VERSION.mac.x86_64.tar.gz | tar -xzv dsurvey > /dev/null 2>&1
      mv dsurvey /tmp/dsurvey
      chmod +x /tmp/dsurvey
  else
      set +x
      echo "The Warp Survey installer does not currently work for your platform: $OS"
      echo "Please let me know at zach@warp.dev"
      exit 1
  fi
}

run_denver_survey