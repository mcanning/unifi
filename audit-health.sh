#!/usr/bin/env bash
set -euo pipefail

cef_log=/var/log/unifi/unifi.cef
raw_log=/var/log/unifi/unifi.raw.log

printf 'Timestamp: '
date --iso-8601=seconds

printf '\nCollector health:\n'
printf 'rsyslog='
systemctl is-active rsyslog
printf 'listener_count='
ss -lun | grep -Ec '(^|[[:space:]])[^[:space:]]*:5514[[:space:]]'
printf 'config_validation='
if rsyslogd -N1 >/dev/null 2>&1; then
    echo ok
else
    echo failed
fi
printf 'cef_lines='
wc -l < "$cef_log"
printf 'raw_lines='
wc -l < "$raw_log"
printf 'network_cef='
grep -Ec 'CEF:[[:space:]]*0[|]Ubiquiti[|]UniFi Network[|]' "$cef_log" || true
printf 'network_security_cef='
grep -E 'CEF:[[:space:]]*0[|]Ubiquiti[|]UniFi Network[|]' "$cef_log" \
    | grep -Eci 'Security|Threat|Intrusion|Blocked|Firewall' || true
printf 'cef_first_timestamp='
head -n 1 "$cef_log" | awk '{print $1}'
printf 'cef_last_timestamp='
tail -n 1 "$cef_log" | awk '{print $1}'

printf '\nCurrent CEF products/events:\n'
grep -E 'CEF:[[:space:]]*0[|]Ubiquiti[|]' "$cef_log" \
    | sed -E 's/^.*CEF:[[:space:]]*0[|]/CEF:0|/' \
    | awk -F'|' '{key=$3 " :: " $6; count[key]++} END {for (key in count) print count[key], key}' \
    | sort -nr

printf '\nHost health:\n'
uptime
free -h | sed -n '1,2p'
df -h / /var/log | sed -n '1,3p'
printf 'failed_units='
systemctl --failed --no-legend | wc -l
systemctl --failed --no-legend || true
printf 'rsyslog_errors_24h='
journalctl -q -u rsyslog --since '24 hours ago' -p err --no-pager -o cat \
    | sed '/^[[:space:]]*$/d' \
    | wc -l
printf 'system_errors_24h='
journalctl -q --since '24 hours ago' -p err --no-pager -o cat \
    | sed '/^[[:space:]]*$/d' \
    | wc -l

printf '\nRunning containers:\n'
docker ps --format '{{.Names}}|{{.Status}}' | sort
