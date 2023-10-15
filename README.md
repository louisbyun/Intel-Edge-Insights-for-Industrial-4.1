# EII<br />
Intel® Edge Insights for Industrial<br />

ssh root@xx.xxx.xx.xxx <br />
EII Install.<br />
cd edge_insights_industrial/<br />
chmod 775 edgesoftware<br />
./edgesoftware install<br />
Product Key: cb67e844-365b-4c6c-9c40-9a4310496115<br />
EII 4.1 document : https://eiidocs.intel.com/4.1/<br />
./edgesoftware --version<br />
./edgesoftware list<br />
./edgesoftware log<br />
./edgesoftware export<br />

<br />
USB v4l2 Cameras<br />
For information or configurations details on the USB cameras, refer to docs/usb_doc.md.<br />
Refer the following configuration for configuring the config.json([WORK_DIR]/IEdgeInsights/EdgeVideoAnalyticsMicroservice/eii/config.json) file for USB v4l2 camera.<br />
"pipeline": "v4l2src device=/dev/<DEVICE_VIDEO_NODE> name=source ! video/x-raw,format=YUY2 ! videoconvert ! video/x-raw,format=BGR ! appsink name=destination"<br />

<br />
# Execute the builder.py script<br />
<pre>python3 builder.py -f usecases/video-streaming.yml</pre>pre><br />
<br /><br />
Run the Containers<br />
To run the containers in the detached mode, run the following command:<br />
# Run config manager agent service first using the below command<br />
<div class="snippet-clipboard-content notranslate position-relative overflow-auto" data-snippet-clipboard-copy-content="sudo raspi-config"><pre class="notranslate"><code>docker-compose up -f ia_configmgr_agent
</code></pre></div>
docker-compose up -f ia_configmgr_agent<br />
# Check config manager agent logs to see if provisioning is complete<br />
docker logs -f ia_configmgr_agent<br />
# Once provisioning is done run other services<br />
docker-compose up -d<br />
<br />
docker-compose build<br />
docker-compose up -d<br />
docker ps<br />
