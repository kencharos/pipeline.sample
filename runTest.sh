#!/bin/sh

#run test
dotnet test /p:CollectCoverage=true /p:CoverletOutputFormat=cobertura --logger:trx\;LogFileName=../ut/res.trx

#make report
rm -rf test-results
mkdir test-results
rm -rf coverage-results
mkdir coverage-results
dotnet run --project UtReport UtReport/trxToJunit.xsl PipelineSample.Test/ut/res.trx test-results/PipelineSample.Test.xml

ret=$?

if test ret = 0; then
  cp PipelineSample.Test/coverage.cobertura.xml coverage-results/PipelineSample.Test.coverage.xml
fi

exit $ret
