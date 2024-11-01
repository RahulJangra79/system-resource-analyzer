# System Resource Analyzer

This script is a Linux-based system resource monitoring tool that tracks CPU, RAM, and disk usage. It logs resource usage when specific thresholds are exceeded, 
making it useful for tracking performance and identifying resource bottlenecks.

# Features

- Monitors CPU, RAM, and Disk usage every 10 seconds.
- Logs data if CPU, RAM, or Disk usage exceeds defined thresholds.
- Stores log entries in a file (`system_usage_log.txt`) with timestamps for easy review.

# Prerequisites

This script requires:

- A Linux-based operating system.
- `bash`, the default shell in most Linux distributions.
- Basic knowledge of shell scripting and permissions to execute scripts.

# Setup and Usage

1. **Clone or Download the Repository:**
   ```bash
   git clone https://github.com/RahulJangra79/system-resource-analyzer.git
   cd <repository-directory>
   ```

2. **Make the Script Executable:**
   Ensure that the script has executable permissions:
   ```bash
   chmod +x monitor.sh
   ```

3. **Run the Script:**
   Execute the script in a terminal window:
   ```bash
   ./monitor.sh
   ```
   The script will begin monitoring CPU, RAM, and Disk usage and log any instances where usage exceeds the set thresholds.

4. **View the Log:**
   The log file, `system_usage_log.txt`, will contain entries with timestamps for each instance when usage thresholds are exceeded:
   ```plaintext
   Timestamp, CPU(%), RAM(%), Disk(%)
   2024-01-01 12:00:00, CPU: 85%, RAM: 82%, Disk: 90%
   ```

## Explanation of Code

1. **Define Thresholds:**
   The script defines thresholds for CPU, RAM, and Disk usage. These can be adjusted by modifying the `CPU_THRESHOLD`, `RAM_THRESHOLD`, and `DISK_THRESHOLD` variables.

2. **Logging Setup:**
   The script initializes a log file, `system_usage_log.txt`, to store all entries with usage above the set thresholds.

3. **Resource Check Functions:**
   - `get_cpu_usage`: Calculates CPU usage using the `top` command.
   - `get_ram_usage`: Calculates RAM usage as a percentage.
   - `get_disk_usage`: Checks Disk usage percentage using the `df` command.

4. **Monitoring Function:**
   - `monitor_resources`: Collects current resource usage and logs entries if any of the usage metrics exceed their respective thresholds.

5. **Infinite Monitoring Loop:**
   The script runs in an infinite `while` loop, checking resources every 10 seconds. Adjust the `sleep` duration if a different frequency is desired.

## Customization

- Modify threshold values for CPU, RAM, and Disk to suit your environment and requirements.
- Change the logging interval by adjusting the `sleep` time in the `while` loop.

## License

This project is open source and available under the [MIT License](LICENSE).





