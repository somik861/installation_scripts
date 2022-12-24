#! /bin/bash

for script in packages/build_*
do
    ./${script}
done
