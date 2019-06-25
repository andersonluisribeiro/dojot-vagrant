#!/bin/bash

export DEBIAN_FRONTEND=noninteractive
export APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=DontWarn

bash /vagrant/joincluster.sh >/dev/null 2>&1