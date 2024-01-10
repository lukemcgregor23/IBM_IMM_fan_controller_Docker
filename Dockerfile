FROM ubuntu:latest

LABEL org.opencontainers.image.authors="tigerblue77"

RUN apt-get update

RUN apt-get install ipmitool -y

ADD IBM_IMM_fan_controller.sh /IBM_IMM_fan_controller.sh

RUN chmod 0777 /IBM_IMM_fan_controller.sh

# you should override these default values when running. See README.md
#ENV IMM_HOST 192.168.1.100
ENV IMM_HOST local
#ENV IMM_USERNAME root
#ENV IMM_PASSWORD root
ENV FAN_SPEED 5
ENV CPU_TEMPERATURE_THRESHOLD 50
ENV CHECK_INTERVAL 60
ENV DISABLE_THIRD_PARTY_PCIE_CARD_DELL_DEFAULT_COOLING_RESPONSE false

CMD ["/IBM_IMM_fan_controller.sh"]
