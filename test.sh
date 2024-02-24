#!/bin/bash

# export TH_VERSION="3.28.0"
export TH_VERSION="3.68.0"

docker run -it -v "$PWD:/pwd" ghcr.io/trufflesecurity/trufflehog:${TH_VERSION} --no-update --no-filter-unverified --no-verification --json --config=/pwd/config/loc_inaccurate.yaml git file:///pwd/ > ./results/loc_inaccurate.json
docker run -it -v "$PWD:/pwd" ghcr.io/trufflesecurity/trufflehog:${TH_VERSION} --no-update --no-filter-unverified --no-verification --json --config=/pwd/config/loc_accurate.yaml git file:///pwd/ > ./results/loc_accurate.json