# Init Containers

Using Init Containers to perform tasks before a pod is deployed.
Init Containers, which are specialized containers that run before application containers and can contain utilities or setup scripts not present in an app image.

# Understanding Init Containers
You can use an Init Container resource to perform tasks before the rest of a pod is deployed.

A pod can have Init Containers in addition to application containers. 
Init containers allow you to reorganize setup scripts and binding code.

## An Init Container can:

- Contain and run utilities that are not desirable to include in the app Container image for security reasons.

- Contain utilities or custom code for setup that is not present in an app image. For example, there is no requirement to make an image FROM another image just to use a tool like sed, awk, python, or dig during setup.

- Use Linux namespaces so that they have different filesystem views from app containers, such as access to Secrets that application containers are not able to access.

- **Each Init Container must complete successfully before the next one is started. So, Init Containers provide an easy way to block or delay the startup of app containers until some set of preconditions are met.

src. https://docs.openshift.com/container-platform/4.1/nodes/containers/nodes-containers-init.html

# Best Practice
There are two init point in this example.
The first waits for myservice and the second waits for mydb. Once both containers complete, the Pod begins.

Demo Scenario: 
 - You will deploy an application which is record information to database.
 - You will deploy app and database in the same time.
 - Your app will cash if db is not exist.
: You can use init Container in this case. You will wait untill db is running then you will start your application

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: myapp-pod
  labels:
    app: myapp
spec:
  containers:
  - name: myapp-container
    image: busybox
    command: ['sh', '-c', 'echo The app is running! && sleep 3600']
  initContainers:
  - name: init-myservice
    image: busybox
    command: ['sh', '-c', 'until nslookup myservice; do echo waiting for myservice; sleep 2; done;']
  - name: init-mydb
    image: busybox
    command: ['sh', '-c', 'until nslookup mydb; do echo waiting for mydb; sleep 2; done;']
```
