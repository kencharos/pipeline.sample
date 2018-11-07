using System;
using System.IO;
using System.Text;
using System.Xml;
using System.Xml.Xsl;

namespace UtReport
{
    /// <summary>
    /// res.trx を XSLT により、所定のフォーマットに変換します。
    /// パスは基本的に ソリューションルートを起点とした相対パス です。
    /// args 0 - XSL スタイルシート. 
    /// args 1 - 入力 trx ファイルパス
    /// args 2 - 出力先 パス
    /// XML出力時にテストにエラーがあるようなら exit code を1にして終了します。
    /// </summary>
    class Program
    {

        static void Main(string[] args)
        {
            var output = args[2];
            var input = args[1];
            var stylesheetUri = args[0];
            
            var xslt = new XslCompiledTransform();
            xslt.Load(stylesheetUri);
            
            // 出力フォーマット の指定
            var settings = new XmlWriterSettings();
            settings.Indent = true;
            settings.OmitXmlDeclaration = output.EndsWith("html");

            // XSLT を利用した 変換処理
            using(var os = new StreamWriter(output, false, Encoding.UTF8))
            using (var writer = XmlWriter.Create(os, settings))
            {
                xslt.Transform(input, writer);
            }
            var ng = HasError(input);
            // 処理結果を出力
            Console.WriteLine("end, hasError?" + ng);
            Environment.Exit(ng ? 1 : 0);
        }

        static bool HasError(string input)
        {

            var xslt = new XslCompiledTransform();
            xslt.Load("UtReport/trxCheckError.xsl");

            // 出力フォーマット の指定
            var settings = new XmlWriterSettings();
            settings.OmitXmlDeclaration = true;

            var output = new StringBuilder();
            // XSLT を利用した 変換処理
            using (var writer = XmlWriter.Create(output, settings))
            {
                xslt.Transform(input, writer);
            }
            return output.ToString().Contains("Error");
        }
    
    }
}
