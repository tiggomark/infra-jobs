

helpFunction()
{
   echo ""
   echo "Usage: $0 -a parameterA -b parameterB -c parameterC"
   echo -e "\t-a Description of what is parameterA"
   echo -e "\t-b Description of what is parameterB"
   echo -e "\t-c Description of what is parameterC"
   exit 1 # Exit script after printing help
}

while getopts "h:s:" opt
do
   case "$opt" in
      h ) host="$OPTARG" ;;
      s ) status="$OPTARG" ;;
      ? ) helpFunction ;; # Print helpFunction in case parameter is non-existent
   esac
done

# Print helpFunction in case parameters are empty
if [ -z "$host" ] || [ -z "$status"]
then
   echo "Some or all of the parameters are empty";
   helpFunction
fi

# Begin script in case all parameters are correct


while [[ ${STATUS_RECEIVED} != ${status} ]];
        do STATUS_RECEIVED=$(curl -s -o /dev/null -L -w ''%{http_code}'' ${host}) &&
        echo "received status: $STATUS_RECEIVED" &&
        sleep 1;
    done;
    echo success with status: $STATUS_RECEIVED'
