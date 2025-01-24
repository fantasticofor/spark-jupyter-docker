FROM apache/spark:4.0.0-preview2-scala2.13-java21-ubuntu

# Switch to root for installations
USER root

# Install Python, pip, and required libraries
RUN set -ex; \
    apt-get update && \
    apt-get install -y python3 python3-pip && \
    rm -rf /var/lib/apt/lists/* && \
    pip install --no-cache-dir jupyter findspark

# Switch back to the Spark user for security
# USER SPARK

# Set a working directory
WORKDIR /workspace

# Expose the Jupyter Notebook port
EXPOSE 8888

# Default command to start Jupyter Notebook
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--no-browser", "--allow-root", "--NotebookApp.token=''", "--NotebookApp.password=''"]