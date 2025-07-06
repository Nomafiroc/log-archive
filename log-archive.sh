#!/bin/bash

read -p "Please enter the directory to archive: " archive

echo $archive

if [ ! -d "$archive" ]; then
	echo "not a directory, exiting program"
	exit 1
else 
	echo "directory exists"
fi

timestamp = $(date + "%Y%m%d_%H%M%S")

echo -e "\nThe time right now is $timestamp"

archive_file="logs_archive_$timestamp.tar.gz"

echo "the new name of the archive file will be: $archive_file"

echo -e "\n\ncompressing the directory\n\n"

tar -cvzf $archive_file $archive

echo -e "\n\nmoving archive to archive saving directory\n\n"

mv $archive_file archive_saver

echo "archive generated at $timestamp" >> archive.log