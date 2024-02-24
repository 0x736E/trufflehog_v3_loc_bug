#!/bin/bash

# export TH_VERSION="3.28.0"
export TH_VERSION="3.68.0"

# git
docker run -it -v "$PWD:/pwd" ghcr.io/trufflesecurity/trufflehog:${TH_VERSION} --no-update --no-filter-unverified --no-verification --json --config=/pwd/config/loc_inaccurate.yaml git file:///pwd/ > ./results/git_loc_inaccurate.json
docker run -it -v "$PWD:/pwd" ghcr.io/trufflesecurity/trufflehog:${TH_VERSION} --no-update --no-filter-unverified --no-verification --json --config=/pwd/config/loc_accurate.yaml git file:///pwd/ > ./results/git_loc_accurate.json

# filesystem
docker run -it -v "$PWD:/pwd" ghcr.io/trufflesecurity/trufflehog:${TH_VERSION} --no-update --no-filter-unverified --no-verification --json --config=/pwd/config/loc_inaccurate.yaml filesystem /pwd/samples/headers/combined.txt > ./results/filesystem_loc_inaccurate.json
docker run -it -v "$PWD:/pwd" ghcr.io/trufflesecurity/trufflehog:${TH_VERSION} --no-update --no-filter-unverified --no-verification --json --config=/pwd/config/loc_accurate.yaml filesystem /pwd/samples/headers/combined.txt > ./results/filesystem_loc_accurate.json