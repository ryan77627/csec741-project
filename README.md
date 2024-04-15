# CSEC-741 Project

### How to use this repo

1. Clone to your local machine (this has been tested on Linux and Docker ONLY)

1. Run the following command to set up your development environment:

```bash
docker image -t esp-idf-env .
```

1. Once the environment is built, run the following command to initialize a container with the necessary files:

```bash
docker run -it --privileged --name esp-env -v $PWD:/opt/esp-idf/examples/csec-741 esp-idf-env
```

1. Once this is running, simply run `. ./export.sh` to finish preparing the container. You are now ready to navigate into `/opt/esp-idf/examples/csec-741`, `cd` into any of the sub directories, and attempt a build.

1. To run a build, run `idf.py build`, to flash run `idf.py flash`, and to connect to the ESP to debug, run `idf.py monitor`. These commands can be combined in any combo, like so: `idf.py build flash monitor`.

**NOTE**: When you are done developing and want to exit, simply run `exit` within the container. Since we did not pass `--rm`, the container will persist on your PC until explicitly removed. This means to continue development, run `docker start -i esp-env` followed by `. ./export.sh` to rebuild the environment and continue where you left off. We are doing it this way to avoid re-cloning all the sub-projects that occur on first build.
