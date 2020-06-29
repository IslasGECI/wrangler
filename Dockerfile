FROM islasgeci/base:19c0
CMD ["bash", "-c", "umask 000 && make"]