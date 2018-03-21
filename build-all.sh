# Create images for each subfolder tagging them without versioning. Default Docker namespace is `carlosafrias`.
clear
if [ -z "$1" ]
    then
        NAMESPACE="munirg"
    else
        NAMESPACE=$1
fi
echo "Building images on all subdirectories..."

for D in *; do
    if [ -d "${D}" ] && [ -s "${D}/Dockerfile" ]; then
        echo "  -- Building image for ${D} ..."
        docker build -t ${NAMESPACE}/yacare:${D} ${D}/
    fi
done

echo "Done!"
