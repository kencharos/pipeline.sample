<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:x="http://microsoft.com/schemas/VisualStudio/TeamTest/2010">
  <!--
  <testsuites name="jest tests" tests="84" failures="6" time="112.303">
  <testsuite name="Classname" errors="0" failures="1" skipped="0" timestamp="2018-11-07T06:46:05" time="2.28" tests="1">
    <testcase classname="ImportRankingToCore コンテンツランキングにレコードが登録できること" name="ImportRankingToCore コンテンツランキングにレコードが登録できること" time="0.209">
      成功以外は以下3つのどれか ただし、MS Testには、errorとfail の区別はない。
      <failure type="java.lang.AssertionError" message="test failed" >stack</failure>
      <error type="java.lang.NullPointerException" message="NPE" ><error>
      <skipped/>
  
  -->
  <xsl:template match="/">
    <xsl:element name="testsuites">
      <xsl:attribute name="name">Test Result</xsl:attribute>
      <xsl:attribute name="tests">
        <xsl:value-of select="/x:TestRun/x:ResultSummary/x:Counters/@total"/>
      </xsl:attribute>
      <xsl:attribute name="failures">
        <xsl:value-of select="/x:TestRun/x:ResultSummary/x:Counters/@failed"/>
      </xsl:attribute>
      <xsl:attribute name="errors">
        <xsl:value-of select="/x:TestRun/x:ResultSummary/x:Counters/@error"/>
      </xsl:attribute>
      
      <xsl:element name="testsuite">
        <xsl:attribute name="name">Test Result</xsl:attribute>
        <xsl:attribute name="tests">
          <xsl:value-of select="/x:TestRun/x:ResultSummary/x:Counters/@total"/>
        </xsl:attribute>
        <xsl:attribute name="failures">
          <xsl:value-of select="/x:TestRun/x:ResultSummary/x:Counters/@failed"/>
        </xsl:attribute>
        <xsl:attribute name="errors">
          <xsl:value-of select="/x:TestRun/x:ResultSummary/x:Counters/@error"/>
        </xsl:attribute>
        <xsl:attribute name="skipped">
          <xsl:value-of select="/x:TestRun/x:ResultSummary/x:Counters/@total - /x:TestRun/x:ResultSummary/x:Counters/@executed"/>
        </xsl:attribute>

        
        <xsl:for-each select="/x:TestRun/x:Results/x:UnitTestResult">

          <xsl:element name="testcase">
            <xsl:attribute name="name">
              <xsl:value-of select="@testName"/>
            </xsl:attribute>
            <xsl:attribute name="classname">
              <xsl:value-of select="@testName"/>
            </xsl:attribute>
            <xsl:attribute name="time">
              <xsl:value-of select="@duration"/>
            </xsl:attribute>


            <xsl:if test="@outcome = 'Failed'">
              <xsl:element name="failure">
                <xsl:attribute name="message">
                  <xsl:value-of select="x:Output/x:ErrorInfo/x:Message"/>
                </xsl:attribute>

                <xsl:value-of select="x:Output/x:ErrorInfo/x:StackTrace"/>
              </xsl:element>
            </xsl:if>
            <xsl:if test="@outcome = 'Error'">
              <xsl:element name="failure">
                <xsl:attribute name="message">
                  <xsl:value-of select="x:Output/x:ErrorInfo/x:Message"/>
                </xsl:attribute>

                <xsl:value-of select="x:Output/x:ErrorInfo/x:StackTrace"/>
              </xsl:element>
            </xsl:if>
            <xsl:if test="@outcome = 'NotExecuted'">
              <xsl:element name="skipped"/>
            </xsl:if>
            
          </xsl:element>
        </xsl:for-each>

      </xsl:element>
    </xsl:element>
  </xsl:template>
</xsl:stylesheet>