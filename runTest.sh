#!/bin/sh

#run test
echo "build and test."
dotnet test /p:CollectCoverage=true /p:CoverletOutputFormat=cobertura --logger:trx\;LogFileName=../ut/res.trx

#make report
echo "make reports"
rm -rf test-results
mkdir test-results
rm -rf coverage-results
mkdir coverage-results
dotnet run --project UtReport UtReport/trxToJunit.xsl PipelineSample.Test/ut/res.trx test-results/PipelineSample.Test.xml

ret=$?


if [ $ret -eq 0 ]; then
  echo "cp coverage report."
  cp PipelineSample.Test/coverage.cobertura.xml coverage-results/PipelineSample.Test.coverage.xml
fi

echo "list artifact files"
ls test-results/
ls coverage-results/

exit $ret
