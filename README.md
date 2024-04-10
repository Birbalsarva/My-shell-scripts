# My-shell-scripts

# Disk Space Monitoring Shell Script

This repository contains a shell script that monitors the disk space usage and sends an alert if it exceeds a specified threshold.

## Script Description

The `disk_space_monitor.sh` script performs the following steps:

1. Retrieves disk space information using the `df -H` command.
2. Extracts the disk usage percentage and file system using the `awk` command.
3. Compares the usage percentage with a predefined threshold (90% by default).
4. If the usage exceeds the threshold, it prints a "CRITICAL" message for the corresponding file system.

## Usage

1. Clone this repository or download the `disk_space_monitor.sh` script.
2. Open a terminal or command prompt and navigate to the directory where the script is located.
3. Make the script executable by running the following command:

   ```shell
   chmod +x disk_space_monitor.sh
   ```

4. Modify the `alert` variable in the script to set your desired threshold. For example, if you want to set the threshold to 90%, update the line `alert=90`.
5. Run the script using the following command:

   ```shell
   ./disk_space_monitor.sh
   ```

6. The script will check the disk space usage and display a "CRITICAL" message for any file system that exceeds the specified threshold.

Note: Ensure that you have appropriate permissions to run shell scripts and access disk space information.

## Script

Here is the content of the `disk_space_monitor.sh` script:

```shell
#!/bin/bash

# Set the threshold for disk usage in percentage
alert=90

# Retrieve disk space information, extract usage percentage, and file system
df -H | awk '{print $5 " " $1}' | while read output;
do
   usage=$(echo $output | awk '{print $1}' | cut -d'%' -f1)
   file_sys=$(echo $output | awk '{print $2}')

   # Check if the usage exceeds the threshold and print a "CRITICAL" message
   if [ $usage -gt $alert ]; then
       echo "CRITICAL for $file_sys"
   fi
done
```

You can save this script as `disk_space_monitor.sh` and follow the instructions provided in the "Usage" section above to execute it.

## Dependencies

This shell script relies on the following dependencies:

- `df` command: Used to retrieve disk space information.
- `awk` command: Used for text processing and extracting disk usage percentage.

Ensure that these dependencies are installed and accessible in the environment where you run the script.
