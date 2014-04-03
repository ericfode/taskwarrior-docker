This is a docker container for running taskwarrior

To run make sure you have fig (from orchardup) installed.

```bash
./setup.sh
```

A few directories should be created containing your keys and your data.
These will be mounted onto your server when your run

```
fig up
```

About the docker container:
```
Port 53589 is exposed
/task_data can be mounted on
/task_keys can be mounted on

taskd server --data /task_data runs by default when  you start the container
```
