SHELL_LOCATION="/usr/local/bin/commit"
SHELL_REMOTE_URL="https://raw.githubusercontent.com/wwwenjie/git-commit-cli/main/commit"

ESC=$(printf "\033")
RED=$ESC[31m
GREEN=$ESC[32m
RESET=$ESC[0m

function setDownloadShellCheckSum {
    checkSum=$(cat $SHELL_LOCATION | shasum -a 256)

    newFileCheckSum="FILE_CHECKSUM=\"${checkSum}\""

    sed -i "" "s/^FILE_CHECKSUM=.*/${newFileCheckSum}/" $SHELL_LOCATION
}

echo "Fetching data..."

curl -sS $SHELL_REMOTE_URL >$SHELL_LOCATION

setDownloadShellCheckSum

clear

chmod +x $SHELL_LOCATION

commit --config

echo
echo "${RESET}Run ${GREEN}commit${RESET} in any git repository to commit easy!"

echo
echo "Run ${GREEN}commit --help${RESET} to get more info"
