#!/bin/bash

KIOSK_ENV="/home/pi/.config/smeup/kioskEnv.sh"

sleep 1

# If no parameters is accessed with kioskWithReload
if [ $# -eq 0 ];
then
    source ${KIOSK_ENV}
    chromium-browser --kiosk --incognito --process-per-site --no-sandbox --no-first-run --fast --fast-start --disable-infobars --disable-restore-session-state --disable-features=TranslateUI --disable-translate --disk-cache-dir=/dev/null --password-store=basic --noerrdialogs --allow-running-insecure ${ARG1}
else
    chromium-browser --kiosk --incognito --process-per-site --no-sandbox --no-first-run --fast --fast-start --disable-infobars --disable-restore-session-state --disable-features=TranslateUI --disable-translate --disk-cache-dir=/dev/null --password-store=basic --noerrdialogs --allow-running-insecure ${1}
fi