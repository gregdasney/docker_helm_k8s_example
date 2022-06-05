# Hello World deployed to kubernetes (minikube) with helm

### Contents
<details>
<summary> 
(Click to expand)
</summary>
```
│   .gitignore
│   helmvalues_node.yaml
│   ReadMe.md
│
├───helmchart
│   │   .helmignore
│   │   Chart.yaml
│   │   values.yaml
│   │
│   ├───charts
│   └───templates
│       │   deployment.yaml
│       │   ingress.yaml
│       │   service.yaml
│       │   _helpers.tpl
│       │
│       └───tests
│               test-connection.yaml
│
├───nodejs_application
│   │   .dockerignore
│   │   Dockerfile
│   │
│   └───app
│           main.js
│           package-lock.json
│           package.json
│
└───ruby_application
        Dockerfile
```
</details>

---
## Web Applications and building

### Node.Js Web Application
The Node.js web application is in the _nodejs_application_ folder along with it's dockerfile.  To build the docker image run `docker build . -t hellworld:nodejs` from inside the folder.
### Rails Web Application
The rails web application is in the _rails_application_ folder along with it's dockerfile.  To build the docker image run `docker build . -t hellworld:rails` from inside the folder.
## Deploying
The following assumes that kubernetes is available on the current context
### Helm chart
A basic helm chart that deploys the built and tagged docker image based on the values file provided.
Two values files are provided to specify which version version of the web appliation to install, other application specific parameters could be provided here.

node.js install:
``` 
$ helm upgrade --install helloworldnode ./helm/chart --values ./helm/values/node.yaml
``` 
rails install:
```
$ helm upgrade --install helloworldrails ./helm/chart --values ./helm/values/rails.yaml
``` 
### Assumptions
1. The image is named _helloworld_
2. The node image is tagged _nodejs_
3. The rails image is tagged _rails_
4. Prior to building `eval $(minikube docker-env)` was run to allow docker to access locally built images
5. minikube is installed and configured for kubectl
---



## How would you manage your terraform State File for multiple environments?

### General State File Management thoughts and considerations
Great care must be taken when handling terraform state files.  They can and usually do contain sensitive information such as passwords, private keys, certificates etc. 

They should be stored in a secure, access contolled manner.  Remote and cloud backends provide one of the easiest and most secure methods of accomplishing this.  

Terraform has many available options for storing and managing state, selection depends on many implementation details that are out of scope for this document.  However two good options are Terraform Cloud, and Amazon S3.

#### Terraform Cloud
# todo
#### Amazon S3
Using an S3 bucket for managing terraform state files would be a good choice if AWS is already integrated with existing infrastructre.  It supports locking and encryption.  It can also support versioning of the state file making it easier to recover from unforseen problems. It can also flexibly support access control to restrict access to the individual files.

### Managing State files for Different Environments.
If using S3 as the backend two obvious solutions present themselves 


## How would you approach managing terraform variables and secrets as well? 
teraform cloud
hashicorp vault



<!-- 

1. Create an application that always responds with “hello world” to web requests
2. Create Dockerfile for this application
3. Write yaml to host in kubernetes
a. Can use minikube or docker desktop
b. Service
c. Deployment with 2 instances of hello world application
4. Readme.md file with instructions how to build and deploy to local kubernetes
5. How would you manage your terraform State File for multiple environments? e.g stage,
prod , demo (please answer in the Readme)
6. How would you approach managing terraform variables and secrets as well? (please
answer in the Readme)
BONUS:
1. Write the “hello world” application in rails
2. Create a helm chart instead of a plain kubernetes yaml manifest file (we use helm here) 
-->
