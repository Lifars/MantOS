#!/bin/bash
exe=$(dmenu_run -fn '-misc-fixed-*-*-*-*-13-100-*-*-*-*-*-*' -nb '#000000' -nf '#FFFFFF' -sb '#458ad3' -sf '#EEEEEE') && eval "exec $exe"
