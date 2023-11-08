echo -e "1.ssh\n2.scp\nselect an option to continue"
read option
#read -p "Please enter the remote system IP address: " IP 
IP=51.20.40.201
#read -p "please enter the username: " username
username=ec2-user
#read -p "please enter private key with path: " private_key
private_key="/c/Users/avina/Downloads/awskey (1).pem"

if [ $option == 1 ]; then
    ssh -i "$private_key" "$username@$IP"
elif [ $option == 2 ]; then
    echo -e "1.local --> remote\n2.remote --> local\nchoose an option to continue: "
    read scp_option
    if [ $scp_option == 1 ]; then
        read -p "please enter the source file: " source_file
        read -p "plaese enter the destination path: " destination_path
        scp -i "$private_key" "$source_file" "$username@$IP:$destination_path"
    elif [ $scp_option == 2 ]; then
        read -p "please enter the file name with path of remote server: " source_path
        read -p "please enter the destination path of local: " local_path
        scp -i "$private_key" "$username@$IP:$source_path" "$local_path"
    else
        echo "choose valid option"
    fi
else
    echo "choose valid option"
fi
