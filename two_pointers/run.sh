#!/bin/bash

# Check if the correct number of arguments is provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <JavaFileName>"
    exit 1
fi

# Get the Java file name from the command line argument
java_file="$1"

# Extract the class name from the Java file (assuming there is only one public class)
class_name=$(grep -e "public class" "$java_file" | awk '{print $3}')

# Compile the Java file
javac "$java_file"

# Check if the compilation was successful
if [ $? -eq 0 ]; then
    echo "Compilation successful"

    # Execute the compiled Java program
    java "$class_name"

    echo "$class_name.class"

    rm "$class_name.class"
else
    echo "Compilation failed"
fi
