#!/bin/bash

cd /opt/spcs
jupyter lab --allow-root --ip=0.0.0.0 --port=8888 --no-browser --notebook-dir=/opt/spcs/stage --NotebookApp.token='' --NotebookApp.password=''
