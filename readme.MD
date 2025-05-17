# Telemetry Project


1. Create EC2 and Install Docker CLI (https://docs.docker.com/engine/install/ubuntu/)
```
# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
```
```
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y

sudo docker run hello-world

sudo usermod -aG docker ubuntu

echo "logout and login again"
```


2. Install Kubectl CLI (https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/)
```
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
```
Validata the binary:
```
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"
```
Validate the kubectl binary against the checksum file:
```
echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check
```

```
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
```

or
```
chmod +x kubectl
mkdir -p ~/.local/bin
mv ./kubectl ~/.local/bin/kubectl

kubectl version --client
```

3. Install Terraform (https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)
```
sudo apt-get update && sudo apt-get install -y gnupg software-properties-common
```

Install Hashicorp GPG Key:
```
wget -O- https://apt.releases.hashicorp.com/gpg | \
gpg --dearmor | \
sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg > /dev/null
```
Check:
```
gpg --no-default-keyring \
--keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg \
--fingerprint
```
```
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
sudo tee /etc/apt/sources.list.d/hashicorp.list
```
```
sudo apt update

sudo apt-get install terraform

terraform --version
```

4. Run Locally:
5. Resize Volume:
```
df -h
```
1. Go to EC2--> Open Volume--> Modify volume to 50GB or 30Gb--> Volume State should -In-use (Wait for sometime)
2. Now check inside EC2--> df -h, still same no disk increased.
3. Check lsblk -->xvda is 50GB but xvda1--> is 7GB
4. Run few commands to resize:
```
sudo apt install cloud-guest-utils

sudo growpart /dev/xvda 1

lsblk

df -h
sudo resize2fs /dev/xvda1

df -h 

```



