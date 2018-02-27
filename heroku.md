If you manage to create the file from **heroku run bash**, you could use [transfer.sh](https://transfer.sh/).

You can even encrypt the file before you transfer it.

```
cat <file_name> | gpg -ac -o- | curl -X PUT -T "-" https://transfer.sh/<file_name>.gpg
```

And then download and decrypt it on the target machine

```
curl https://transfer.sh/<hash>/<file_name>.gpg | gpg -o- > <file_name>
```
