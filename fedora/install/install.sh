#!/usr/bin/env bash

dnf install --setopt="install_weak_deps=False" $(cat ~/config/)
