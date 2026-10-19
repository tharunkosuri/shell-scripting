#!/bin/bash

start_time=$(date +%s)
echo "Script started execution at: $start_time"

sleep 10
end_time=$(date +%s)
echo "Script started execution at: $end_time"
total_time=$(($end_time-$start_time))
echo "Total time taken: $total_time seconds"