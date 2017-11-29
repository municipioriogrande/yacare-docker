# Pushes all images to Docker Hub.
clear
if [ -z "$1" ]
    then
        NAMESPACE="carlosafrias"
    else
        NAMESPACE=$1
fi
echo "Pushing images to Docker Hub..."

for D in *; do
    if [ -d "${D}" ] && [ -s "${D}/Dockerfile" ]; then
        echo "  -- Pushing image for ${D} ..."
        docker push ${NAMESPACE}/yacare:${D}
    fi
done

echo "Done!"
