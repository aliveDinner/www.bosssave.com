#!/usr/bin/env bash
set -x

if [ "{{.Git.ObjectKind}}" != "push" ]; then
    return 0
fi

if [ "refs/heads/{{.Branch}}" != "{{.Git.Ref}}" ]; then
    return 0
fi

if [ ! -d "{{.WebRoot}}/{{.Git.Repository.Name}}"  ]; then
    mkdir -p {{.WebRoot}}
    cd {{.WebRoot}}
    git clone -b master {{.Git.Repository.GitSSHUrl}} --quiet
    cd {{.WebRoot}}/{{.Git.Repository.Name}}

    git checkout {{.Branch}} --quiet
fi

cd {{.WebRoot}}/{{.Git.Repository.Name}}

# 设置git不处理文件权限
git config core.filemode false

# 检出最新代码
git checkout {{.Branch}} --quiet
git fetch -p --all --quiet
git reset --hard origin/{{.Branch}} --quiet

# 修改项目目录权限
chown -R nginx:nginx {{.WebRoot}}/{{.Git.Repository.Name}}