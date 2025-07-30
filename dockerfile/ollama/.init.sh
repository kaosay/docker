#!/bin/bash
echo "$USER:$PASSWD" | chpasswd
/bin/ollama serve &
