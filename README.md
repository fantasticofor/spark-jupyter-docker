# Spark in Docker

This Dockerfile is designed to let you run Spark 4.0.0-preview2-scala2.13-java21-ubuntu in a Docker container with Jupyter Notebook support.
The aim is to simplify the use of Notebooks by:

- Disabling token authentication.
- Allowing an empty password.

## Build the Docker Image

Build and give a tag to the image, here "spark-jupyter" is given.

```bash
docker build -t spark-jupyter .
```

## Run the Container

```bash
docker run -p 8888:8888 -v ${PWD}/workspace:/workspace spark-jupyter
```

### Explanation of Flags:

- `p 8888:8888`: Maps Jupyter's port to your local machine.
- `v $(pwd)/workspace:/workspace`: Mounts your local `workspace` directory to the container's `/workspace` directory, ensuring all files are saved locally.

## Access Jupyter Notebook

Open your browser and navigate to: http://localhost:8888.
Since token authentication and password are disabled, you can directly start using the Jupyter interface.

## Create and Open a Jupyter Notebook

In the Jupyter Notebook interface, click New → Python 3 to create a new notebook.
Start coding in the notebook using Python and Spark! 🎉

# Notes

If you need to install additional Python libraries while the container is running, you can open a terminal in Jupyter or into the container itself and use `pip install <library>`.
To rebuild the image after changing the Dockerfile, rerun the build command `docker build -t spark-jupyter .`

## Alternative to spylon-kernel: Apache Toree Kernel

Apache Toree Kernel, supports Scala and integrates better with Spark.
To install Toree add this line to your Dockerfile: `RUN pip install --no-cache-dir toree && jupyter toree install --spark_home=/opt/spark`
Replace `/opt/spark` with your Spark installation directory if it's different.
