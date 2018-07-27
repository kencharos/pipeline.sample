using System;
using System.Collections.Generic;
using System.Text;

namespace PipelineSample
{
    public static class SomeUtil
    {
        public static int SomeAbs(int num)
        {
            // verbose logic for branch coverage.
            if (num >= 0)
            {
                return num;
            } else
            {
                return -num;
            }
        }
    }
}
