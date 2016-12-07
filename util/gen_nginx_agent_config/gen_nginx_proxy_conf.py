# /usr/bin/python
# -*- coding:utf-8 -*-
"""
  This tool can generate nginx configuration files,
  while the domain name of the agent is added to
  the '/etc/hosts' file mapped to '127.0.0.1'
  Create by Cao Ya'nan <cyn_rich@163.com> at 2016-12-06 12:17
"""
import os


def gen_nginx_conf():
    """生成nginx反向代理配置文件，并将被代理域名添加到
    '/etc/hosts'文件中，映射为'127.0.0.1'
    """
    data_file_path = 'reverse_data.md'
    nginx_file_path = 'nginx_agent_conf'
    if not os.path.exists(data_file_path):
        print '%s not found', data_file_path
    data_file = open(data_file_path, 'r')
    data_file_lines = data_file.readlines()
    data_file.close()

    host_file = open('hosts', 'w+')
    nginx_conf_file = open(nginx_file_path, 'w+')
    for domain in data_file_lines:
        dm_map = domain.split(' ')
        dname = dm_map[0]
        agent = dm_map[1]
        host_file.write('127.0.0.1 ' + dname.strip(' ') + '\n')
        nginx_conf_file.write('server {' + '\n')
        nginx_conf_file.write('    listen 80;' + '\n')
        nginx_conf_file.write('    server_name ' + dname + ';' + '\n')
        nginx_conf_file.write('    location / {' + '\n')
        nginx_conf_file.write('        proxy_pass http://' +
                              agent.strip('\t').strip('\n') + ';\n')
        nginx_conf_file.write('    }' + '\n')
        nginx_conf_file.write('}' + '\n')
        nginx_conf_file.write('' + '\n')

    host_file.close()
    nginx_conf_file.close()

if __name__ == '__main__':
    gen_nginx_conf()

