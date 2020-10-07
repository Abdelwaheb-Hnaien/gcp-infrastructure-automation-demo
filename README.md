1. devops folder should be in the root directory of your project
2. Check the folder named packages where you can find VMs startup scripts, we recommand that any assets other than terraform and yaml configs have to be placed under this folder
3. to run the demo :
- build 'infrastructure_builder' from gcp_infrastructure_builder repository (follow instructions in README.txt)
- Create a backend Storage Bucket
- you need to change "your-project-id" and "your-backend-bucket-name" with appropriate values in : devops/cd/IaC/resources/config/dev (preprod and prod)
- make sure of infrastructure_builder full URL in cloudbuild.yaml (assuming it is in your project container registery)
- Grant Cloud build the necessary IAM permission to create resources in your project (step 1)
- Create a trigger that points to the repository containing this code and set Cloud Build configuration file field to "devops/Cloudbuild.yaml"
