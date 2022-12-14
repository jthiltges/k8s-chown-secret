#!/bin/sh

SOURCE_DIR=${SOURCE_DIR:-/source}
TARGET_DIR=${TARGET_DIR:-/target}
TARGET_CHOWN=${TARGET_CHOWN:-0:0}
TARGET_CHMOD=${TARGET_CHMOD:-F0600}

do_sync () {
  rsync -a \
    --copy-links \
    --exclude=/..*/ \
    --chown="$TARGET_CHOWN" \
    --chmod="$TARGET_CHMOD" \
    "$SOURCE_DIR"/ "$TARGET_DIR"
}

echo "Running initial sync"
do_sync

# Wait for the move of the ..data symlink
inotifywait --monitor --event moved_to --timefmt %FT%T%z --format %T \
      $SOURCE_DIR \
    | while read timestamp ; do

  echo "Change at $timestamp"

  do_sync

done
