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
        [InlineData(0, 0)]
        public void TestAbs(int input, int expect)
        {
            Assert.Equal(expect, SomeUtil.SomeAbs(input));
        }
    }
}
