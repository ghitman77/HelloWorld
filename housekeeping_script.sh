#! /bin/sh
# keepnewest files as per predefined number
#



#if [ $# -ne 2 ]; then
#  echo 1>&2 "Usage: $0 <dir> <number of files to keep>"
#  exit 1
#fi

TARGET_DIR=/eniq/data/etldata_/00/event_e_lte_err/raw/9/
NUM_FILES=150

#cd $1
cd $TARGET_DIR
files_in_dir=`ls | wc -l`
files_to_delete=`expr $files_in_dir - $NUM_FILES`
if [ $files_to_delete -gt 0 ]; then
  ls -t | tail -$files_to_delete | xargs rm
  if [ $? -ne 0 ]; then
    echo "An error ocurred deleting the files"
    exit 1
  else
    echo "`date +%H%M` `date +%d%b%Y`  --->  $files_to_delete file(s) deleted."
  fi
else
  echo "`date +%H%M` `date +%d%b%Y`   --->   nothing to delete!"
fi
