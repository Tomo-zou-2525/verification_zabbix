#!/bin/bash

# ルートディレクトリのファイル作成
touch main.tf providers.tf terraform.tf

# モジュールディレクトリの作成
modules_dirs=("server" "network")

for dir in "${modules_dirs[@]}"; do
  mkdir -p "modules/$dir"
  touch "modules/$dir/main.tf" "modules/$dir/outputs.tf" "modules/$dir/terraform.tf" "modules/$dir/variables.tf"
done

echo "Terraformプロジェクトのディレクトリ構造とファイルが作成されました。"