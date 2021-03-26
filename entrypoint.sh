#!/bin/bash
cd /home/container
# Replace Startup Variables
MODIFIED_STARTUP=$(echo $(echo -e ${STARTUP} | sed -e 's/{{/${/g' -e 's/}}/}/g'))
START_COMMAND=$(echo -e ${MODIFIED_STARTUP})
echo -e ":/home/container$ ${START_COMMAND}"
#设置文件权限
chmod 775 *
# Run the Server
echo 正在启动服务器
${MODIFIED_STARTUP}
echo 服务器已关闭
