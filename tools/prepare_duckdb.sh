#!/usr/bin/env bash
# dart_duckdb 1.4.4 paketi Android derlemesinde GitHub'dan v1.4.4 etiketli zip'leri indirmeye çalışır; o etiket yayımlanmamış (404).
# Bu betik aynı dosyaları yayımlanmış v1.4.2 sürümünden (DuckDB 1.4.2 ikilileri) indirip paketin beklediği jniLibs dizinine açar;
# gradle "already exists" görüp indirmeyi atlar. Yerelde ve CI'da `flutter build` öncesi çalıştırılır.
set -euo pipefail
VER="${DUCKDB_DART_TAG:-v1.4.2}"
PKG=$(ls -d "${PUB_CACHE:-$HOME/.pub-cache}"/hosted/pub.dev/dart_duckdb-* | sort -V | tail -1)
for abi in arm64-v8a armeabi-v7a; do
  dir="$PKG/android/src/main/jniLibs/$abi"
  if [ -f "$dir/libduckdb.so" ]; then echo "$abi: var"; continue; fi
  mkdir -p "$dir"; tmp=$(mktemp -d)
  curl -sSL -o "$tmp/duck.zip" "https://github.com/TigerEyeLabs/duckdb-dart/releases/download/$VER/libduckdb-android_$abi.zip"
  python3 - "$tmp/duck.zip" "$dir" <<'PY'
import sys, zipfile, os
z, out = sys.argv[1], sys.argv[2]
with zipfile.ZipFile(z) as f:
    for n in f.namelist():
        if n.endswith('.so'):
            with f.open(n) as src, open(os.path.join(out, os.path.basename(n)), 'wb') as dst: dst.write(src.read())
PY
  rm -rf "$tmp"
  echo "$abi: $(du -h "$dir/libduckdb.so" | cut -f1) ($VER)"
done
# iOS: podspec aynı yayımlanmamış etiketi indirir; yayımlanmış sürüme çevir (pod install öncesi)
for spec in "$PKG"/ios/*.podspec; do
  sed -i.bak "s#releases/download/v1\.4\.4/#releases/download/$VER/#" "$spec" && rm -f "$spec.bak" && echo "podspec: $(basename "$spec") → $VER"
done
