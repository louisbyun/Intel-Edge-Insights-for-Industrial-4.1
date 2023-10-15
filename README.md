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
<br />
# Execute the builder.py script
python3 builder.py -f usecases/video-streaming.yml<br />
docker-compose build<br />
docker-compose up -d<br />
docker ps<br />
