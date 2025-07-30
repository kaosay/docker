#!/bin/bash

# chroot   $NEWROOT  /bin/bash

printf "+--------------------------------------------------JingsuAI--------------------------------------------------------+
"
printf "目录说明:
"
printf "╔═════════════════╦════════╦════╦═════════════════════════════════════════════════════════════════════════╗
"
printf "║目录             ║名称    ║速度║说明                                                                     ║
"
printf "╠═════════════════╬════════╬════╬═════════════════════════════════════════════════════════════════════════╣
"
printf "║/                ║系 统 盘║一般║实例关机数据不会丢失，可存放代码等。会随保存镜像一起保存。               ║
"
printf "║/jinsu/data      ║数 据 盘║ 快 ║实例关机数据不会丢失，可存放读写IO要求高的数据。但不会随保存镜像一起保存 ║
"

printf "╚═════════════════╩════════╩════╩═════════════════════════════════════════════════════════════════════════╝
"

  cores=$(cat /sys/fs/cgroup/cpu.max | awk '{print $1/$2}')
  printf "CPU ：%s 核心
" ${cores}

  limit_in_bytes=$(cat /sys/fs/cgroup/memory.max)
  memory="$((limit_in_bytes / 1024 / 1024 / 1024)) GB"
  printf "内存：%s
" "${memory}"


if type nvidia-smi >/dev/null 2>&1; then
  gpu=$(nvidia-smi -i 0 --query-gpu=name,count --format=csv,noheader)
  printf "GPU ：%s
" "${gpu}"
fi


df_stats=`df -ah`
printf "存储：
"
disk=$(echo "$df_stats" | grep "/$" | awk '{print $5" "$3"/"$2}')
printf "  系 统 盘/               ：%s
" "${disk}"

if test -d /jinsu/data ; then
  disk=$(echo "$df_stats" | grep "jinsu/data" | awk '{print $5" "$3"/"$2}')
  if test -z "$disk" ; then
    disk="未挂载"
  fi
  printf "  数 据 盘/jinsu/data	  ：%s
" "${disk}"
fi

/etc/profile.d/load_env.sh


printf "+----------------------------------------------------------------------------------------------------------------+
"


