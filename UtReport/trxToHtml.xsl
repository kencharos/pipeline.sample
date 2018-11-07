<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:x="http://microsoft.com/schemas/VisualStudio/TeamTest/2010">
  <xsl:template match="/">
    <html>
      <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <style>
          table {
          border:1px solid black;
          }
          table tr {
          border:1px solid black;
          }
          table tr td{
          border:1px solid black;
          }
          table tr th{
          border:1px solid black;
          }
        </style>
        <title>UT Result</title>
      </head>

      <body>
        <h1>UTResult </h1>
        <h2>サマリ</h2>
        <p>
          <xsl:if test="/x:TestRun/x:ResultSummary/x:Counters/@failed &gt; 0">
            <span color="red" class="IncludingFailTest">失敗しているテストがあります。</span>
          </xsl:if>
          <xsl:if test="/x:TestRun/x:ResultSummary/x:Counters/@error &gt; 0">
            <span color="red" class="IncludingFailTest">失敗しているテストがあります。</span>
          </xsl:if>
        </p>
        <table>
          <tr>
            <th>全体</th>
            <th>OK</th>
            <th>NG</th>
            <th>エラー</th>
          </tr>
          <td>
            <xsl:value-of select="/x:TestRun/x:ResultSummary/x:Counters/@total"/>
          </td>
          <td>
            <xsl:value-of select="/x:TestRun/x:ResultSummary/x:Counters/@passed"/>
          </td>
          <td>
            <xsl:value-of select="/x:TestRun/x:ResultSummary/x:Counters/@failed"/>
          </td>
          <td>
            <xsl:value-of select="/x:TestRun/x:ResultSummary/x:Counters/@error"/>
          </td>
        </table>

        <h2>結果リスト</h2>
        <table>
          <tr>
            <th>テストメソッド</th>
            <th>実行時間</th>
            <th>結果</th>
          </tr>
          <xsl:for-each select="/x:TestRun/x:Results/x:UnitTestResult">
            <tr>
              <td>
                <xsl:value-of select="@testName"/>
              </td>
              <td>
                <xsl:value-of select="@duration"/>
              </td>

              <td>
                <xsl:value-of select="@outcome"/>
              </td>
            </tr>
          </xsl:for-each>
        </table>

        <h2>出力</h2>
        <textarea style="width:100%; height:400px;">
          <xsl:value-of select="/x:TestRun/x:ResultSummary/x:Output/x:StdOut"/>
        </textarea>

      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>