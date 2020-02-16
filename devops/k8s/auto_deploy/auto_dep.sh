cwd=$(pwd)
type=$1

echo $type Deploying.....

echo "1) Docker Image Creation"
cd $cwd/../../docker
bash create_image.sh

cd $cwd
echo "2) Clean Old Deployment"
kubectl delete -f $cwd/../${type}_dep.yaml -n $type

echo "3) Deploying new $(type) deployment.."
kubectl create -f $cwd/../${type}_dep.yaml -n $type

echo "4) You can access in the adress"
kubectl get ing -n ${type}