# create_sql_patch

Small utility generate "sql patch file" (for db repositories).

# Howto make

type `make all` in terminal.

output sample:

```bash
$ make all

CGO_ENABLED=0 GOOS=windows GOARCH=amd64 go build -o binary/win64/create_sql_patch.exe -v
CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o binary/linux64/create_sql_patch -v
CGO_ENABLED=0 GOOS=darwin GOARCH=amd64 go build -o binary/mac64/create_sql_patch -v
```
# Howto use

simple type `create_sql_patch` (or `./create_sql_patch`) with one parametr `patch_name`:

```bash
$./create_sql_patch test

Patch file created: 20180822184401872260__test.sql
Date: 22.8.2018; time: 18:44:1; msec: 872260
```

And you will see:

```bash
$ ls -la

-rw-r--r--   1 staff  staff     0 22 srp 18:44 20180822184401872260__test.sql
```

