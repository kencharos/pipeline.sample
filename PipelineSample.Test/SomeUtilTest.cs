using System;
using Xunit;
using PipelineSample;

namespace PipelineSample.Test
{
    public class SomeUtilTest
    {
        [Theory]
        [InlineData(42, 42)]
        [InlineData(-42, 42)]
        //[InlineData(-42, 41)] // assertion fail
        //[InlineData(-42, -90)] // runtime error
        [InlineData(0, 0)]
        public void TestAbs(int input, int expect)
        {
            if (expect < 0)
            {
                throw new ArgumentException("expect is positive");
            }

            Assert.Equal(expect, SomeUtil.SomeAbs(input));
        }

        [Fact(Skip ="skip")]
        public void SkipTest()
        {

        }
    }
}
