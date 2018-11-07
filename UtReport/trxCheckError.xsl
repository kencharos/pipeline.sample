<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:x="http://microsoft.com/schemas/VisualStudio/TeamTest/2010">
  <xsl:template match="/">
    <xsl:if test="/x:TestRun/x:ResultSummary/x:Counters/@failed &gt; 0">
      <Error/>
    </xsl:if>
    <xsl:if test="/x:TestRun/x:ResultSummary/x:Counters/@error &gt; 0">
      <Error/>
    </xsl:if>
  </xsl:template>
</xsl:stylesheet>