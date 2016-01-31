###========================================================================
### File: Dockerfile
###
###
### Author(s):
###   - Enrique Fernandez <enrique.fernandez@erlang-solutions.com>
###
###
### The MIT License (MIT)
###
### Copyright (c) 2016, Erlang Solutions AB
###
### Permission is hereby granted, free of charge, to any person obtaining a
### copy of this software and associated documentation files (the
### "Software"), to deal in the Software without restriction, including
### without limitation the rights to use, copy, modify, merge, publish,
### distribute, sublicense, and/or sell copies of the Software, and to
### permit persons to whom the Software is furnished to do so, subject to
###  the following conditions:
###
### The above copyright notice and this permission notice shall be included
### in all copies or substantial portions of the Software.
###
### THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
### OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
### MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
### IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
### CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
### TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
### SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
###========================================================================
FROM       java:6-jre

MAINTAINER Enrique Fernandez <enrique.fernandez@erlang-solutions.com>

ENV DYNAMODB_BASE_URL http://dynamodb-local.s3-website-us-west-2.amazonaws.com
ENV DYNAMODB_TAR_FILE dynamodb_local_2016-01-07_1.0.tar.gz

RUN mkdir /opt/dynamodb && \
    cd /opt/dynamodb    && \
    wget -O - $DYNAMODB_BASE_URL/$DYNAMODB_TAR_FILE | tar zxf -

ENTRYPOINT [ "java", "-Djava.library.path=./DynamoDBLocal_lib", \
                     "-jar",                                    \
                     "/opt/dynamodb/DynamoDBLocal.jar" ]
CMD        [ "-sharedDb", "-port", "8000"]
