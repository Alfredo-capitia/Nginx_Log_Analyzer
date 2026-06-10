# Nginx Log Analyzer

A lightweight Bash script to analyze Nginx access logs and extract key metrics for monitoring and troubleshooting.

Project reference: [roadmap.sh — Nginx Log Analyser](https://roadmap.sh/projects/nginx-log-analyser)

## Features

- **Top IP Addresses** — Identifies the top 5 client IPs making the most requests.
- **Most Requested Paths** — Lists the top 5 URL paths (endpoints) hit the most.
- **HTTP Status Codes** — Shows the top 5 response status codes and their frequency.
- **User Agents** — Displays the top 5 user agent strings seen in the logs.

## Requirements

- Bash 4+
- Standard Unix utilities: `awk`, `sort`, `uniq`, `head`

## Usage

```bash
chmod +x nginx_log_analizer.sh
./nginx_log_analizer.sh
```

By default, the script reads from `nginx-access.log` in the same directory. To analyze a different log file, update the `FILE_LOG` variable inside the script.

### Sample Output

```
=========Top 5  ip address with most requests========
    159 159.89.185.30
    159 178.128.94.113
    159 142.93.136.176
    159 138.68.248.85
     22 206.81.24.74
 =============== Top 5 paths with most requests  ===============
    318 /v1-health
     12 /vendor/phpunit/phpunit/src/Util/PHP/eval-stdin.php
      8 /
      5 /v2/_catalog
      5 /server-status
 ========== Top 5 status code with most requests ================
    276 200
     66 404
      6 400
      1 403
      1 304
 ============ Top 5 user agents ============
    278 "DigitalOcean Uptime Probe 0.22.0 (https://digitalocean.com)"
     25 "Custom-AsyncHttpClient"
     11 "Go-http-client/1.1"
      9 "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 (StatusCake)"
      6 "Mozilla/5.0 (Linux; Android 6.0; HTC One M9 Build/MRA931953) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2461.98 Mobile Safari/537.3"
```

## How It Works

The script uses `awk` to extract specific fields from each log line (standard Nginx combined log format):

| Field | Log Position | Meaning |
|-------|-------------|---------|
| `$1`  | Client IP   | `178.128.94.113` |
| `$7`  | Request path | `/v1-health` |
| `$9`  | Status code  | `200` |
| `$12+`| User agent   | `"Mozilla/5.0 ..."` |

Each field is sorted, counted with `uniq -c`, ranked numerically with `sort -rn`, and limited to the top 5 with `head -5`.

## Project Structure

```
nginx_log_analizer/
├── nginx_log_analizer.sh   # Main analysis script
├── nginx-access.log         # Sample Nginx access log
└── README.md                # This file
```

## License

This project is for educational purposes as part of a DevOps course.
