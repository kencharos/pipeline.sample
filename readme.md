# .NET Core UT and coverage sample with SqlServer

## usage

run sqlserver docker

```
docker run -e "ACCEPT_EULA=Y" -e "SA_PASSWORD=MSsqlPassword01" -p 1433:1433 -d microsoft/mssql-server-linux:2017-CU8
```

then, run test with coverage report.

`dotnet test /p:CollectCoverage=true /p:CoverletOutputFormat=lcov PipelineSample.Test`

finally, got following result

```
+----------------+--------+--------+--------+
| Module         | Line   | Branch | Method |
+----------------+--------+--------+--------+
| PipelineSample | 100%   | 100%   | 100%   |
+----------------+--------+--------+--------+
```

## run test in bitbucket pipeline

see [bitbcuket pipeline configfile](./bitbucket-pipelines.yml)

If you make other CI service's yaml,
This probably works other CI services (ex, Travis, Circle CI, gitlab-ci, concource).