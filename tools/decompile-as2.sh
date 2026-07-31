#!/usr/bin/env bash
set -euo pipefail

if [[ $# -ne 2 ]]; then
  echo "用法: $0 <输入.swf> <输出目录>" >&2
  exit 2
fi

script_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
workspace_dir="$(cd -- "${script_dir}/.." && pwd)"
input_swf="$1"
output_dir="$2"

if [[ ! -f "${input_swf}" ]]; then
  echo "找不到 SWF: ${input_swf}" >&2
  exit 1
fi

mkdir -p "${output_dir}"

java_bin=""
for candidate in \
  "$(command -v java 2>/dev/null || true)" \
  /opt/homebrew/opt/openjdk/bin/java \
  /usr/local/opt/openjdk/bin/java \
  /opt/homebrew/Cellar/openjdk/*/libexec/openjdk.jdk/Contents/Home/bin/java
do
  if [[ -n "${candidate}" ]] && [[ -x "${candidate}" ]] && "${candidate}" -version >/dev/null 2>&1; then
    java_bin="${candidate}"
    break
  fi
done

if [[ -z "${java_bin}" ]]; then
  echo "找不到可用的 Java。请先运行: brew install openjdk" >&2
  exit 1
fi

ffdec_home="${TMPDIR:-/tmp}/anti-swf-ffdec-${UID}"
mkdir -p "${ffdec_home}"

"${java_bin}" -Duser.home="${ffdec_home}" -jar "${workspace_dir}/tools/ffdec/ffdec.jar" \
  -config "autoDeobfuscate=true,as12DeobfuscatorExecutionLimit=10000000,autoRenameIdentifiers=false,deobfuscateAs12RemoveInvalidNamesAssignments=false,resolveConstants=true,parallelSpeedUp=false" \
  -export script "${output_dir}" "${input_swf}"

echo "反编译完成: ${output_dir}/scripts"
