import matplotlib.pyplot as plt
import pandas as pd

# Read the CSV file
df = pd.read_csv('docker_stats-without_any_refresh_20231201.csv', parse_dates=['Timestamp'])

# Plot graphs for CPU and Memory usage of Visualizer and EVAM
fig, (ax1, ax2) = plt.subplots(2, 1, figsize=(10, 8), sharex=True)

# CPU Usage Graph
for container, group in df.groupby('Container'):
    ax1.plot(group['Timestamp'], group['CPU Usage'].str.rstrip('%').astype('float'), label=container)

ax1.set_ylabel('CPU Usage (%)')
ax1.legend()

# Memory Usage Graph
for container, group in df.groupby('Container'):
    ax2.plot(group['Timestamp'], group['Memory Usage'], label=container)

ax2.set_xlabel('Timestamp')
ax2.set_ylabel('Memory Usage (MB)')
ax2.legend()

# Set title
plt.suptitle('CPU and Memory Usage Over Time for Visualizer and EVAM (No Refeshing) - 640x640 - 2 Cams')

# Save the graph as an image file
plt.savefig('docker_stats_graph.png')

# Display the graph
plt.show()
