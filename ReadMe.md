<!-- ```
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
2. Create a helm chart instead of a plain kubernetes yaml manifest file (we use helm here
``` -->

# Hello World deployed to kubernetes (minikube) with helm

## Web Applications and building

### Node.Js Web Application
The Node.js web application is in the _nodejs_application_ folder along with its dockerfile.  To build the docker image run `docker build . -t helloworld:nodejs` from inside the folder.
### Rails Web Application
The rails web application is in the _rails_application_ folder along with its dockerfile.  To build the docker image run `docker build . -t helloworld:rails` from inside the folder.

## Deploying
The following assumes that kubernetes is available on the current context
### Helm chart
A basic helm chart that deploys the built and tagged docker image based on the values file provided.
Two values files are provided to specify which version of the web application to install, other application specific parameters could be provided here.

node.js install:
``` 
$ helm upgrade --install helloworldnode ./helm/chart --values ./helm/values/node.yaml
``` 
rails install:
```
$ helm upgrade --install helloworldrails ./helm/chart --values ./helm/values/rails.yaml
``` 
### Assumptions
1. The image is named `helloworld`
2. The node image is tagged `nodejs`
3. The rails image is tagged `rails`
4. minikube is installed, running and configured for kubectl
5. Prior to building `eval $(minikube docker-env)` was run to allow minikube to access locally built docker images

---



## How would you manage your terraform State File for multiple environments?

### General State File Management thoughts and considerations
Great care must be taken when handling terraform state files.  They can and usually do contain sensitive information such as passwords, private keys, certificates etc. Because of this they should be stored in a secure, access controlled manner.

Remote and cloud backends provide one of the easiest and most secure methods of accomplishing this.  

Terraform has many available options for remote backends and managing state, selection depends on many implementation details that are out of scope for this document.  However two good options are Terraform Cloud, and Amazon S3.

#### Terraform Cloud
By default Terraform cloud will manage the state file for you and keep it in an encrypted store, it also has native support for environments.  Creating a workspace for the terraform run in each environment is a conceptually simple but effective method for keeping the state files separate.

#### Amazon S3
Using an S3 bucket for managing terraform state files would be a good choice if AWS is already integrated with existing infrastructure.  It supports locking and encryption.  It can also support versioning of the state file making it easier to recover from unforeseen problems. It can also flexibly support access control to restrict access to the individual files.

##### Managing State files for Different Environments.
If using S3 as the backend two natural solutions present themselves.

##### Separate workspaces per environment.
This is one of the simpler methods in that you only have to configure terraform once and only have to manage one S3 bucket for the storage of the state files.  One of the downsides of this method is that there is a risk of something getting misconfigured and a terraform run in dev accidentally making changes in prod. 

##### Separate S3 bucket and terraform credentials for each environment.
While the initial investment for getting things set up may take longer since each environment has to be provisioned with its own credentials and S3 bucket the possibility of crossing the environment boundary is very low since the the credentials have no access to resources in other environments.

## How would you approach managing terraform variables and secrets as well?

Terraform variables and secrets can be managed in many ways.
Most if not all modern/popular pipeline or CI/CD software has some sort of support for securely storing and accessing secrets and variables. 
* Azure pipelines calls them [Variable Groups](https://docs.microsoft.com/en-us/azure/devops/pipelines/library/variable-groups?view=azure-devops&tabs=yaml). 
* Github Calls them [Encrypted Secrets](https://docs.github.com/en/actions/security-guides/encrypted-secrets).
* Jenkins has a plugin called [Credentials Plugin](https://github.com/jenkinsci/credentials-plugin).
* Terraform Cloud has [Variable Sets](https://learn.hashicorp.com/tutorials/terraform/cloud-multiple-variable-sets)

All of these support the secure storage of secrets/credentials along with the ability to access them securely from the executing pipeline.
I would make a selection based on what services/infrastructure are currently in use and make a recommendation based on what is already available.


