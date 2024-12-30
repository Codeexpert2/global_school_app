#!/bin/bash

sh inc.sh

dart fix --apply

flutter clean && flutter build apk --split-per-abi
