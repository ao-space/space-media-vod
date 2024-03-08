FROM xfan1024/openeuler:23.03-light AS base_image

FROM base_image AS build

RUN yum install -y curl gcc openssl openssl-devel zlib-devel kernel-headers pcre-devel git make

RUN mkdir nginx

RUN git clone https://github.com/ao-space/nginx-vod-module.git

ARG NGINX_VERSION=1.23.0
ARG VOD_MODULE_VERSION=d96b61febe06f147f937dde721921f2d2206c6bc

RUN curl -sL https://nginx.org/download/nginx-${NGINX_VERSION}.tar.gz | tar -C /nginx --strip 1 -xz

WORKDIR /nginx
RUN ./configure --prefix=/usr/local/nginx \
	--add-module=../nginx-vod-module \
	--with-http_ssl_module \
	--with-file-aio \
	--with-threads \
	--with-cc-opt="-O3"
RUN make
RUN make install
RUN rm -rf /usr/local/nginx/html /usr/local/nginx/conf/*.default

FROM base_image
RUN yum install -y ca-certificates openssl pcre zlib
COPY --from=build /usr/local/nginx /usr/local/nginx
COPY nginx.conf /usr/local/nginx/conf/nginx.conf
ENTRYPOINT ["/usr/local/nginx/sbin/nginx"]
CMD ["-g", "daemon off;"]
