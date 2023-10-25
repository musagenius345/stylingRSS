<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:dc="http://purl.org/dc/elements/1.1/"
    xmlns:content="http://purl.org/rss/1.0/modules/content/"
    xmlns:atom="http://www.w3.org/2005/Atom">

    <xsl:template match="/rss">
        <html>
          <head>
            <link rel="stylesheet" href="pico.min.css"/>
            <!-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@picocss/pico@1.5.10/css/pico.min.css"> -->
              <title>RSS Feed</title>
            <style>
              .light{
                opacity: 0.7;
              }
            </style>
          </head>
            <body class="container">
                <h1>RSS Feed</h1>
                <xsl:apply-templates select="channel/item"/>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="item">
      <details class="item">
            <p class="light"><xsl:value-of select="pubDate" /></p>
            <summary><xsl:value-of select="title" /></summary>
            <p class="description">
                <xsl:value-of select="description" disable-output-escaping="yes" />
            </p>
            <p><a href="{link}">Read More</a></p>
        </details>
    </xsl:template>

</xsl:stylesheet>

