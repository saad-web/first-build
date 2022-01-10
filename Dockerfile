FROM mcr.microsoft.com/dotnet/core/aspnet:3.1-buster-slim
RUN mkdir /var/MerchantPMTService
COPY MerchantPMTService /var/MerchantPMTService
RUN mkdir /var/cert
COPY cert /var/cert
COPY aksa-sds-ca-certificate.crt /usr/local/share/ca-certificates/
RUN update-ca-certificates
WORKDIR /var/MerchantPMTService
EXPOSE 5000/tcp
ENV ASPNETCORE_URLS http://*:5000
ENV TZ=Asia/Karachi
ENTRYPOINT ["dotnet", "MerchantPMTService.dll"]
