# EII 4.1.0<br />
Intel® Edge Insights for Industrial<br />

Over the past few months, I have been working on developing a robot-driven backend system for extracting defective products using artificial intelligence machine learning models that can be used in factories.
We are validating and developing Intel Edge Insights for Industrial.
This system from Intel doesn't seem to have been verified in the market yet, so we're working hard to verify it.
So, I would like to share the verified results here.

Test cases for CPU and Merory Usages<br />

1. Use cases: video-streaming-evam.yml
2. System Hardware Specification:<br />
Processor: 11th Gen Intel(R) Core(TM) i7-1165G7 @ 2.80GHz 2.80 GHz<br />
Installed RAM: 8.00GB (7.68GB usable)<br />
System Type: 64-bit operating system, x64-based processor

AppContexts:<br />
- ConfigMgrAgent<br />
- EdgeVideoAnalyticsMicroservice/eii<br />
- Visualizer/multimodal-data-visualization-streaming/eii<br />
- Frame size 640 x 640<br />
![docker-stats-graph_320x320-2Cams](https://github.com/louisbyun/Intel-Edge-Insights-for-Industrial-4.1/assets/55345082/2a49aac7-6726-42ec-a4be-58b2cc3a9061)

![docker-stats-graph_640x640-2Cams](https://github.com/louisbyun/Intel-Edge-Insights-for-Industrial-4.1/assets/55345082/2b1cd016-7b14-4339-9683-9a1085aee798)

![docker_stats_graph-no-refreshing](https://github.com/louisbyun/Intel-Edge-Insights-for-Industrial-4.1/assets/55345082/c2e1b752-c13e-4597-8ff2-ddea59864e0d)

I have conducted the test once again. It is EII version 4.1.0. For the test conditions, I limited the time of EVAM's Publisher to 0.1 seconds and conducted the test. However, the issue still persists where the Web Visualizer's CPU usage does not drop once it goes up.

Below are the test conditions.

AppContexts:
ConfigMgrAgent
EdgeVideoAnalyticsMicroservice/eii
Visualizer/multimodal-data-visualization-streaming/eii
USB Camera 2ea (Multi Instance)
 
My test results are as follows. Unlike the previous test, the frame size of the camera remained the same as the original source.

![CPU and Memory Usage Over Time for Visualizer and EVAM (v4 1 0) - Publisher(0 1s delay) - 2 Cams](https://github.com/louisbyun/Intel-Edge-Insights-for-Industrial-4.1/assets/55345082/5b8424f5-ff62-4f23-b71a-f194bce38655)


How to Install Intel Edge Insights for Industrial<br />
ssh root@xx.xxx.xx.xxx <br />
EII Install.<br />
<div class="snippet-clipboard-content notranslate position-relative overflow-auto" data-snippet-clipboard-copy-content="cd edge_insights_industrial"><pre class="notranslate"><code>cd edge_insights_industrial/
</code></pre></div><br />
<div class="snippet-clipboard-content notranslate position-relative overflow-auto" data-snippet-clipboard-copy-content="chmod 775 edgesoftware"><pre class="notranslate"><code>chmod 775 edgesoftware
</code></pre></div><br />
<div class="snippet-clipboard-content notranslate position-relative overflow-auto" data-snippet-clipboard-copy-content="./edgesoftware install"><pre class="notranslate"><code>./edgesoftware install
</code></pre></div><br />

Product Key: cb67e844-365b-4c6c-9c40-9a4310496115<br />
EII 4.1 document : https://eiidocs.intel.com/4.1/<br />
./edgesoftware --version<br />
./edgesoftware list<br />
./edgesoftware log<br />
./edgesoftware export<br />

USB v4l2 Cameras<br />
For information or configurations details on the USB cameras, refer to docs/usb_doc.md.<br />
Refer the following configuration for configuring the config.json([WORK_DIR]/IEdgeInsights/EdgeVideoAnalyticsMicroservice/eii/config.json) file for USB v4l2 camera.<br />

<div class="snippet-clipboard-content notranslate position-relative overflow-auto" data-snippet-clipboard-copy-content="pipeline camera"><pre class="notranslate"><code>"pipeline": "v4l2src device=/dev/<DEVICE_VIDEO_NODE> name=source ! video/x-raw,format=YUY2 ! videoconvert ! video/x-raw,format=BGR ! appsink name=destination"
</code></pre></div><br />
<br />

# Execute the builder.py script
<div class="snippet-clipboard-content notranslate position-relative overflow-auto" data-snippet-clipboard-copy-content="python3 builder.py"><pre class="notranslate"><code>python3 builder.py -f usecases/video-streaming.yml
</code></pre></div><br />
<br />
Run the Containers<br />
To run the containers in the detached mode, run the following command:<br />
# Run config manager agent service first using the below command<br />
<div class="snippet-clipboard-content notranslate position-relative overflow-auto" data-snippet-clipboard-copy-content="docker-compose up"><pre class="notranslate"><code>docker-compose up -f ia_configmgr_agent
</code></pre></div><br />
# Check config manager agent logs to see if provisioning is complete<br />
<div class="snippet-clipboard-content notranslate position-relative overflow-auto" data-snippet-clipboard-copy-content="docker logs"><pre class="notranslate"><code>docker logs -f ia_configmgr_agent
</code></pre></div>
<br />
# Once provisioning is done run other services<br />
<div class="snippet-clipboard-content notranslate position-relative overflow-auto" data-snippet-clipboard-copy-content="docker-compose build"><pre class="notranslate"><code>docker-compose build
</code></pre></div>
<div class="snippet-clipboard-content notranslate position-relative overflow-auto" data-snippet-clipboard-copy-content="docker-compose up -d"><pre class="notranslate"><code>docker-compose up -d
</code></pre></div>
<div class="snippet-clipboard-content notranslate position-relative overflow-auto" data-snippet-clipboard-copy-content="docker-compose push"><pre class="notranslate"><code>docker-compose push
</code></pre></div>
<div class="snippet-clipboard-content notranslate position-relative overflow-auto" data-snippet-clipboard-copy-content="docker-compose down"><pre class="notranslate"><code>docker-compose down
</code></pre></div>
<br />
<div class="snippet-clipboard-content notranslate position-relative overflow-auto" data-snippet-clipboard-copy-content="docker ps"><pre class="notranslate"><code>docker ps
</code></pre></div>

<div class="snippet-clipboard-content notranslate position-relative overflow-auto" data-snippet-clipboard-copy-content="docker stop"><pre class="notranslate"><code>docker stop ***

</code></pre></div><br />

When testing with multiple computers using one product key, the localhost host IP may not change.<br />
Dev mode: http://xxx.xxx.xxx.xxx:5004/<br />
Normal mode: https://xxx.xxx.xxx.xxx:5003/<br />
Localhost Basic port: http://xxx.xxx.xxx.xxx:8888/<br />
<br /><br />




