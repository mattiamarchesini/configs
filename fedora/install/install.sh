#!/usr/bin/env bash

dnf install -y --setopt='install_weak_deps=False' $(cat install/dnf-requirements | tr "\n" " ")
