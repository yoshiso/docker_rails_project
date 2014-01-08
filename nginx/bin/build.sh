#!/bin/bash

cd `/usr/bin/dirname $0`
docker build -t yoshiso/rails_project_nginx .