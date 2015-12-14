## HotRod

HotRod's 'supervisor' script.

### Requirements

Weave

    echo "+++ Install Weave if needed"
    docker-machine ssh $THESERVER 'test -f /usr/local/bin/weave || { curl -L https://github.com/weaveworks/weave/releases/download/latest_release/weave > /usr/local/bin/weave && chmod u+x /usr/local/bin/weave; }'    

### Config

Could be launch with a docker-compose file looking like:

    hotrodctl:
      image: panoptix/hotrod-hotrodctl:release-v0.2.0
      environment:
        - HOTROD_PROJNAME=${PROJECT_NAME}
        - WEAVE_PASSWORD=${WEAVE_PASSWORD}
      net: host
      restart: always
      volumes:
        - /usr/local/bin:/usr/local/bin
        - /var/run/docker.sock:/var/run/docker.sock
        - /var/run/weave:/var/run/weave
      labels:
        za.co.panoptix.hotrod.projectname: "${PROJECT_NAME}"
        
### Labels

The script will scan for containers with the designated labels, in this case 'HotrodDev', and start them in the order:

    core, 0, 1, 2
    
Could be configured with docker-compose

    service:
      ...   
      labels:
        za.co.panoptix.hotrod.startorder: "2"
        za.co.panoptix.hotrod.projectname: "HotrodDev"      
                

### License

The MIT License (MIT)

Copyright (c) Panoptix CC

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
