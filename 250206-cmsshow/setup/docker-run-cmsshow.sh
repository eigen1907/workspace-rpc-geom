docker run -it --rm \
    --platform=linux/amd64 \
    -e DISPLAY=host.docker.internal:0 \
    -v /tmp/.X11-unix:/tmp/.X11-unix:rw \
    -v /Users/eigen1907/workspace-mac/workspace-rpc-geom:/cmsShow-11.1.2/workspace-rpc-geom \
    aljamrak/fireworks:cmsShow-11.2
