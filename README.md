## Script para migrar repos desde bitbucket a gitlab

## Antes de correr este script: 
* Recuerda crear el repo en gitlab
* Tener permisos de Maintainer o Admin en el repo (o grupo) nuevo para poder hacer el push inicial sobre el repositorio de gitlab que creaste previamente

## Exportar el password token de gitlab en la consola
Por única vez mientras estes usando este script, ejecutar en la consola:

```bash
GITLAB_TOKEN=user:token
export GITLAB_TOKEN
```
## Ejecución

Dar permisos de ejecución al archivo:
```bash
chmod +x bitbucket-to-gitlab.sh
```
```bash
/bitbucket-to-gitlab.sh bit_bucket_repo gitlab_repo
```

ejemplo: 
```bash
./bitbucket-to-gitlab.sh git@bitbucket.org:old.git https://gitlab.com/new.git
```
