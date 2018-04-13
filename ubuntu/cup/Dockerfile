FROM 10.4.65.226/library/ubt-cv-eigen:1.0.0

COPY cup /home/cup
RUN cd /home/cup && mkdir build && cd build && cmake .. && make -j
