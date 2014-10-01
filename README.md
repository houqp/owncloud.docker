
owncloud.docker
===============

Docker file for owncloud


Build
-----

run `./build.sh`. This will build the data container ($USER/oc-data) and the
web server container ($USER/oc-nginx).


Run
---

1. setup your database server
2. run data contaier: `docker run -d --name oc_data $USER/oc-data`
3. replace keys and certificates with your own in `oc-nginx/ssl/nginx`
4. run server container:
   `docker run -d -p 80:80 -p 443:443 --volumes-from oc_data $USER/oc-nginx`

There is also an example run script (run.exmaple.sh) that bootstraps everything
(including mysql server container). Default account for mysql is
`admin:password`.


Configure
---------

The max upload file size can be adjusted by setting the $MAX_UPLOAD_SIZE
environment vairiable when running the server container:

```bash
docker run -d -p 80:80 -p 443:443 --volumes-from oc_data -e MAX_UPLOAD_SIZE="5G" --name oc_nginx $USER/oc-nginx
```
