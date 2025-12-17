#!/usr/bin/env bash

# Tell build process to exit if there are any errors.
set -oue pipefail


run0 curl -fsSLo /etc/yum.repos.d/brave-browser.repo https://brave-browser-rpm-release.s3.brave.com/brave-browser.repo
run0 rpm-ostree install brave-browser