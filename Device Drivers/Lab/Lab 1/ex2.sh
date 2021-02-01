#!/bin/bash
hash_file="./ex2_files/hashes.txt"
# check whether the files have been uppdated since the last iteration
function init_hash() {
    for file in $@
    do
        echo "$file"
        if [[ -d $file ]]; then
            echo "Skipping directory for hashing $file"
        else
            prev_hash=$(grep $file $hash_file)
            new_hash=$(sha256sum $file)
            if [[ $prev_hash == $new_hash ]];
            then
                echo "$file has not been updated"
            else
                echo "$file has changed since the last execution... hashes being updated"
                sha256sum ./* > ./ex2_files/hashes.txt
                echo "All hashes updated"
                bool=false
                return 1
            fi
        fi
    done
}
echo "This will check if the files is updated from the previous execution of the file"
echo "Base Address $hash_file"

echo $bool
time init_hash $@;