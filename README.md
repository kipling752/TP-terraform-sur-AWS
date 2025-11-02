# TP Terraform sur AWS — Documentaire

Ce document raconte, de façon claire et pédagogique, le projet "TP Terraform sur AWS" contenu dans ce dépôt. Il vise à expliquer le pourquoi, le comment et les bonnes pratiques à respecter lorsque vous utilisez cette configuration Terraform.

## Contexte
Ce TP a pour objectif d'illustrer la création d'une infrastructure AWS minimale à l'aide de Terraform. Il déploie une instance EC2 simple (AMI, type d'instance, nom, et clé SSH) afin de démontrer le workflow Infrastructure-as-Code : écrire, versionner, initialiser et appliquer des plans Terraform.

## Objectifs pédagogiques
- Se familiariser avec la structure d'un projet Terraform
- Séparer la configuration et les identifiants sensibles
- Utiliser un `.gitignore` adapté pour ne pas versionner les fichiers locaux et secrets
- Déployer une instance EC2 basique

## Architecture et fichiers principaux
- `ec2.tf` : configuration principale contenant le provider et la ressource `aws_instance`.
- `variables.tf` : déclarations des variables (clé d'accès, clé secrète, région). Les variables sensibles sont marquées `sensitive = true`.
- `terraform.tfvars.example` : exemple de fichier de variables à remplir localement. NE PAS commiter vos vraies clés.
- `.gitignore` : exclut `.terraform/`, les fichiers `*.tfstate`, `*.tfvars`, et le lockfile local.

## Bonnes pratiques (sécurité)
- Ne jamais committer vos clés AWS, ni les fichiers `terraform.tfstate` ni le dossier `.terraform`.
- Stocker les identifiants dans un fichier local `terraform.tfvars` (ignoré par `.gitignore`) ou utiliser des variables d'environnement / profils AWS.
- Pour CI/CD, utiliser des secrets du runner (GitHub Actions secrets, GitLab CI variables, etc.)

## Comment utiliser ce dépôt (rapide)
1. Copier l'exemple de variables et renseigner vos identifiants localement :

```powershell
Copy-Item terraform.tfvars.example -Destination terraform.tfvars
# puis éditez terraform.tfvars et renseignez aws_access_key et aws_secret_key
```

2. Initialiser et déployer (dans le dossier `tp-2`)

```powershell
terraform init
terraform plan -out=tfplan
terraform apply "tfplan"
```

3. Nettoyage

```powershell
terraform destroy
```

Remarque : si vous utilisez des profils AWS (fichier `~/.aws/credentials`) ou des rôles IAM, vous pouvez éviter de stocker des clés dans `terraform.tfvars`.

## Scénarios d'amélioration
- Ajout d'un module pour factoriser la création d'instances
- Gestion d'un VPC, sous-réseaux et groupes de sécurité
- Ajout d'un module d'outputs et de tagging plus poussé
- Intégration CI/CD pour l'exécution contrôlée des plans

## Licence et crédit
Ce dépôt est un exercice pédagogique. Adaptez le code à vos besoins et supprimez toute clé ou information sensible avant de partager.

---

Si vous voulez que j'adapte le style (plus narratif, plus technique, plus court) ou que j'ajoute une section spécifique (diagramme d'architecture, captures d'écran, ou instructions pour GitHub Actions), dites-moi et je le ferai.