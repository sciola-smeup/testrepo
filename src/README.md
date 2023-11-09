# Docker develop

To improve develop experience was create a procedure that help developer to use node-red in a container and save in local project the correct totem file flows.json.  
This avoid to import flows or any other json in node-red.

### How to

To use this functionality, go in `src/docker` and start this command in this manner.  
The requirements to use correctly set the correct values in file `src/docker/var.sh`.  
After that use:

```bash
# Build
bash build.sh

# Start container (move the local flow file in container)
bash start.sh

# Stop container (save the )
bash stop.sh

# Remove all
bash remove.sh
```

> **NB: After `build.sh` command the user can loop with commands `start.sh` and `stop.sh`**

> **NB2: On host the flow.json was saved when the user run `stop.sh`**
